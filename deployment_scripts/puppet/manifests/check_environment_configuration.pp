#    Copyright 2015 Talligent, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

$openbook = hiera('openbook')

# Check that JVM size doesn't exceed the physical RAM size
$jvmsize_mb = ($openbook['jvm_heap_size'] + 0.0) * 1024
$available_mb = $::memorysize_mb - 256
if $jvmsize_mb > $available_mb {
  fail("The configured JVM size (${ $openbook['jvm_heap_size'] } GB) is greater than the total amount of RAM available on the system (${ $available_mb } of ${ ::memorysize_mb }).")
}
