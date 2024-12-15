




public entry fun publish_package_txn (
	owner: &signer, 
	metadata_serialized: vector<u8>, 
	code: vector<vector<u8>>
) acquires PackageRegistry {
	publish_package(owner, util::from_bytes<PackageMetadata>(metadata_serialized), code)

}