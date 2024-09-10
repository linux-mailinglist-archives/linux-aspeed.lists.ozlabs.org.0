Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D6973A17
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 16:39:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X35tz1fplz2ykx
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2024 00:39:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.204
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725979158;
	cv=none; b=IwpKVcYRlg1Tvig/4cgO7VYcAx2IBTGbf58JF0ZDWd/V+9C3osUz98Sd+0q8i/BB/LzNYOoQaJNT6yPvmrMUbf2vxbxX4H8IrCjtbGG1IhWd+WrXh8h1HM+oSkVIoMJHo3DeNSOxdhFkah1VVswD5ieq5s8qfMA+pTKcaXPOnT5Ljab3KW/Xr+/gGADpUOebz9s724rOX0+KPIIrbXi6d/kZf2jovqZP8/VMZero03KPSrkv6hwUqiDkYQCeSMIXIhnJUCdLtSdG2q0xdR1Y7h0tcZC54AyUZGD3ddbMrhC6e9hwv8PHYng57CF6xl+uMxje6AH9MQaPI5tkgb9YMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725979158; c=relaxed/relaxed;
	bh=k4UWyVS+2tcAytJYgFXMoHIRUoSCQAGbLANI8TMBojA=;
	h=Message-ID:From:Date:Subject:To:Cc; b=Y3eV38v6ghFmS1WZ62K84rPghFVSQ5JUavbUT/XSobSFKeYSBFnihmitAdLx81pk+jnExQdTp6JHVcyKQbEPHQiM+Iza/EZp5BZZxAWdDiNwxv0qm0d1tO7lDEBpZkiEPmOMln0mxZintQMP+n/0TJSl9vBd4RRnKYVomCqrLAZkvZIqnI4sPWLSLEX/HdM9bszAGTUdCi6sv1cq7E9ffpI5dZUOpsFkGVjrQ5sUszhAhvt6Uso8A7yqiWykLAKCsND0RKiajerAYE6C26WT60xS4UwLychtpG485Pd7yQgJk5UmojFX7L4Qc3IgBSzD5jUqou44AXRSaMYZNiXRlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 500 seconds by postgrey-1.37 at boromir; Wed, 11 Sep 2024 00:39:17 AEST
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X35ts3nm5z2yV3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2024 00:39:17 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 776D110192657;
	Tue, 10 Sep 2024 16:30:39 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 4707E60A79C3;
	Tue, 10 Sep 2024 16:30:39 +0200 (CEST)
X-Mailbox-Line: From b74f4875ae056ff8aa20b7530fe4f41592581c63 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:10 +0200
Subject: [PATCH v2 00/19] Migrate to sig_alg and templatize ecdsa
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, "Dimitri John Ledkov" <dimitri.ledkov@canonical.com>
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Zhiqi Song <songzhiqi1@huawei.com>, linux-aspeed@lists.ozlabs.org, "Michael S. Tsirkin" <mst@redhat.com>, Stephan Mueller <smueller@chronox.de>, Jason Wang <jasowang@redhat.com>, William Qiu <william.qiu@starfivetech.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Ignat Korchagin <ignat@cloudflare.com>, Longfang Liu <liulongfang@huawei.com>, Marek Behun <kabel@kernel.org>, Eric Snowberg <eric.snowberg@oracle.com>, Jia Jie Ho <jiajie.ho@starfivetech.com>, lei he <helei.sig11@bytedance.com>, Eugenio Perez <eperezma@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Varad Gautam <varadgautam@google.com>, Gonglei <arei.gonglei@huawei.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, Andrew Zaborowski <andrew.zaborowski@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Roberto Sassu <roberto.sassu@huawei.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, Denis Kenzior <denkenz@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The original impetus of this series is to introduce P1363 signature
decoding for ecdsa (patch [18/19]), which is needed by the upcoming
SPDM library (Security Protocol and Data Model) for PCI device
authentication.

To facilitate that, move X9.62 signature decoding out of ecdsa.c and
into a template (patch [15/19]).

New in v2:  Move the maximum signature size calculations for ecdsa
out of software_key_query() and into the X9.62 template so that
corresponding calculations can be added for P1363 without further
cluttering up software_key_query() (patch [16/19] - [17/19]).

New in v2:  Avoid inefficient copying from kernel buffers to sglists
in the new templates by introducing a sig_alg backend and migrating
all algorithms to it, per Herbert's advice (patch [02/19] - [12/19]).

Clean up various smaller issues that caught my eye in ecdsa
(patch [01/19] and [14/19]), ecrdsa (patch [19/19]) and
ASN.1 headers (patch [13/19]).

I've also accumulated various cleanups for crypto virtio on my
development branch but will leave them for another day as this
series is already nearing the "too big to review" threshold. ;)

I've run selftests on every single commit, but further testing
would be appreciated to raise the confidence.


Link to v1:

https://lore.kernel.org/all/cover.1722260176.git.lukas@wunner.de/

Changes v1 -> v2:

* [PATCH 13/19] ASN.1: Clean up include statements in public headers
  * Drop "#include <linux/bug.h>" from <linux/asn1_encoder.h> (Jonathan)

* [PATCH 14/19] crypto: ecdsa - Avoid signed integer overflow on signature
  decoding
  * Add code comment explaining why vlen may be larger than bufsize (Stefan)

* [PATCH 15/19] crypto: ecdsa - Move X9.62 signature decoding into template
  * Drop unnecessary "params", "param_len" and "algo" definitions from
    ecdsa_nist_p{192,256,384,521}_tv_template[].
  * Introduce and use struct ecdsa_raw_sig in <crypto/internal/ecc.h>.

* [PATCH 18/19] crypto: ecdsa - Support P1363 signature decoding
  * Drop unnecessary "params", "param_len" and "algo" definitions from
    p1363_ecdsa_nist_p256_tv_template[].


Lukas Wunner (19):
  crypto: ecdsa - Drop unused test vector elements
  crypto: sig - Introduce sig_alg backend
  crypto: ecdsa - Migrate to sig_alg backend
  crypto: ecrdsa - Migrate to sig_alg backend
  crypto: rsa-pkcs1pad - Deduplicate set_{pub,priv}_key callbacks
  crypto: rsassa-pkcs1 - Migrate to sig_alg backend
  crypto: rsassa-pkcs1 - Harden digest length verification
  crypto: rsassa-pkcs1 - Avoid copying hash prefix
  crypto: virtio - Drop sign/verify operations
  crypto: drivers - Drop sign/verify operations
  crypto: akcipher - Drop sign/verify operations
  crypto: sig - Move crypto_sig_*() API calls to include file
  ASN.1: Clean up include statements in public headers
  crypto: ecdsa - Avoid signed integer overflow on signature decoding
  crypto: ecdsa - Move X9.62 signature decoding into template
  crypto: sig - Rename crypto_sig_maxsize() to crypto_sig_keysize()
  crypto: ecdsa - Move X9.62 signature size calculation into template
  crypto: ecdsa - Support P1363 signature decoding
  crypto: ecrdsa - Fix signature size calculation

 Documentation/crypto/api-akcipher.rst         |   2 +-
 Documentation/crypto/api-sig.rst              |  15 +
 Documentation/crypto/api.rst                  |   1 +
 Documentation/crypto/architecture.rst         |   2 +
 crypto/Kconfig                                |   5 +-
 crypto/Makefile                               |   5 +-
 crypto/akcipher.c                             |  64 +-
 crypto/asymmetric_keys/public_key.c           |  58 +-
 crypto/ecdsa-p1363.c                          | 159 ++++
 crypto/ecdsa-x962.c                           | 237 +++++
 crypto/ecdsa.c                                | 209 ++---
 crypto/ecrdsa.c                               |  64 +-
 crypto/internal.h                             |  19 -
 crypto/rsa-pkcs1pad.c                         | 371 +-------
 crypto/rsa.c                                  |  17 +-
 crypto/rsassa-pkcs1.c                         | 442 +++++++++
 crypto/sig.c                                  | 143 +--
 crypto/testmgr.c                              | 320 +++++--
 crypto/testmgr.h                              | 884 +++++++++++++++---
 drivers/crypto/aspeed/aspeed-acry.c           |   2 -
 drivers/crypto/hisilicon/hpre/hpre_crypto.c   |   2 -
 drivers/crypto/starfive/jh7110-rsa.c          |   2 -
 .../virtio/virtio_crypto_akcipher_algs.c      |  65 +-
 include/crypto/akcipher.h                     |  69 +-
 include/crypto/internal/akcipher.h            |   4 +-
 include/crypto/internal/ecc.h                 |  14 +
 include/crypto/internal/rsa.h                 |  29 +
 include/crypto/internal/sig.h                 |  80 ++
 include/crypto/sig.h                          | 152 ++-
 include/linux/asn1_decoder.h                  |   1 +
 include/linux/asn1_encoder.h                  |   1 -
 include/linux/slab.h                          |   1 +
 include/uapi/linux/cryptouser.h               |   5 +
 include/uapi/linux/virtio_crypto.h            |   1 +
 security/integrity/ima/ima_main.c             |   6 +-
 35 files changed, 2398 insertions(+), 1053 deletions(-)
 create mode 100644 Documentation/crypto/api-sig.rst
 create mode 100644 crypto/ecdsa-p1363.c
 create mode 100644 crypto/ecdsa-x962.c
 create mode 100644 crypto/rsassa-pkcs1.c

-- 
2.43.0

