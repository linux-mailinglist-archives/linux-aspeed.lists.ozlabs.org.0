Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 294769914D1
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Oct 2024 08:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLFRG5g9pz3bgQ
	for <lists+linux-aspeed@lfdr.de>; Sat,  5 Oct 2024 16:11:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728108681;
	cv=none; b=Mmsw2nWqmuI/q0oon6MSoZDNNnfI6gpGyw2DXTVc3BpUBODZhWf2NV3DwRqchQuqtxhYsSAEHRnAzIQG5DsyrObF0o9aIa2kbE0D8QzULZbHPurJ+0j2M2Fld6fGxHSFcTMUTzoNTqhTAFrOzzyED+odL/ZKxzzSHgy5I7CXZ61MdskO35ip0AvulDWKcNMX3Go69LxSCoJO8HFxbfIydlzCMQ+qlen1TjXG4sLkyXNZXyDzC7lvzsTOKwJxf03EHO4BqDBcEUuc8yqSDt+c+9UPRRUKNczHL3NDSwszIywez62mraf5CYEq6Gs2gWH4F4gO/haloUqsKXd3TZjXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728108681; c=relaxed/relaxed;
	bh=FmDrERpeXqDIAqQ+D2TzT1nK31RfU5C95/VpOEG/MvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP/cbIJ6NJ3BpxMX9SESOj5LByJmwOInMWvTPGp8YrPPLO8q5buTtcZO2YdJz2VSYYhEn9/1S07G/2sQKRRCsdkfTIzQUwBjbOY7GPjCsf08BLfp4V/S30M6YibE88KXCTxASt97e46E0LIu2ooBq/dG3cwbv+dvz8tP3htLZzfJfU+jNvaIxaHbfmsQEfUUpB+sp3goMHlPf+97AN79weEq6oZgEjSVClDySFJ1IJEqfdHH4eN4vthgw+0yw+fcif9Lkim0SMvYve2BlJ8OVVL9DFji+aZ5+RfzxoD4YvK994TQoEgR0EYUDvDCtywNezYBAZBSlIgdt5PZaoKRgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=MsaDtPNn; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=MsaDtPNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 2523 seconds by postgrey-1.37 at boromir; Sat, 05 Oct 2024 16:11:20 AEST
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLFRD3ZySz2xmh
	for <linux-aspeed@lists.ozlabs.org>; Sat,  5 Oct 2024 16:11:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FmDrERpeXqDIAqQ+D2TzT1nK31RfU5C95/VpOEG/MvU=; b=MsaDtPNnV6e7iHZj7T4/TqgZNP
	HKb6uydoPZIqxinyigHsVKzChFG2gkzZp7UxBVtr/F2JTf9bufZAr+vNNdPoFfq1xMbu1VCzr0OAL
	xzpM/Pu3hlzZt+pVNFuLpB1gHix+6USYir6DLBXZNWOJDPQoTESvkhQGSW7AfrUkCiHQY4TTmaK2q
	AxSjQSGLYv+SfLVh/bSZAulR4L6HoyWiW5MDheDY4aUt1S/IuIeRGxWv4+w0CDMyvf51Y1epO9nfV
	DksEF/GqaZEGOMO7q0t92UO4wbYEJf9HiyKMl9aS4qusghl0JLrQ9xsRrNQv6737S4KxQEpJNs2fB
	B8N56wVQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1swxAl-0071S6-08;
	Sat, 05 Oct 2024 13:27:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 05 Oct 2024 13:27:56 +0800
Date: Sat, 5 Oct 2024 13:27:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 00/19] Migrate to sig_alg and templatize ecdsa
Message-ID: <ZwDOXKZ8QrOvpGAW@gondor.apana.org.au>
References: <cover.1725972333.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Zhiqi Song <songzhiqi1@huawei.com>, linux-aspeed@lists.ozlabs.org, Eric Biggers <ebiggers@google.com>, Stephan Mueller <smueller@chronox.de>, Jason Wang <jasowang@redhat.com>, Tadeusz Struk <tstruk@gigaio.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Ignat Korchagin <ignat@cloudflare.com>, Longfang Liu <liulongfang@huawei.com>, Marek Behun <kabel@kernel.org>, Eric Snowberg <eric.snowberg@oracle.com>, Jia Jie Ho <jiajie.ho@starfivetech.com>, lei he <helei.sig11@bytedance.com>, Eugenio Perez <eperezma@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Varad Gautam <varadgautam@google.com>, Gonglei <arei.gonglei@huawei.com>, William Qiu <william.qiu@starfivetech.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, Andrew Zaborowski <andrew.zaborowski@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vitaly Chikunov <vt@altlinux.org>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Roberto Sassu <roberto.sassu@huawei.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, Stefan Berger <stefanb@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Dimitri John Ledkov <dimitri.ledkov@canonical.com>, Denis Kenzior <denkenz@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2024 at 04:30:10PM +0200, Lukas Wunner wrote:
> The original impetus of this series is to introduce P1363 signature
> decoding for ecdsa (patch [18/19]), which is needed by the upcoming
> SPDM library (Security Protocol and Data Model) for PCI device
> authentication.
> 
> To facilitate that, move X9.62 signature decoding out of ecdsa.c and
> into a template (patch [15/19]).
> 
> New in v2:  Move the maximum signature size calculations for ecdsa
> out of software_key_query() and into the X9.62 template so that
> corresponding calculations can be added for P1363 without further
> cluttering up software_key_query() (patch [16/19] - [17/19]).
> 
> New in v2:  Avoid inefficient copying from kernel buffers to sglists
> in the new templates by introducing a sig_alg backend and migrating
> all algorithms to it, per Herbert's advice (patch [02/19] - [12/19]).
> 
> Clean up various smaller issues that caught my eye in ecdsa
> (patch [01/19] and [14/19]), ecrdsa (patch [19/19]) and
> ASN.1 headers (patch [13/19]).
> 
> I've also accumulated various cleanups for crypto virtio on my
> development branch but will leave them for another day as this
> series is already nearing the "too big to review" threshold. ;)
> 
> I've run selftests on every single commit, but further testing
> would be appreciated to raise the confidence.
> 
> 
> Link to v1:
> 
> https://lore.kernel.org/all/cover.1722260176.git.lukas@wunner.de/
> 
> Changes v1 -> v2:
> 
> * [PATCH 13/19] ASN.1: Clean up include statements in public headers
>   * Drop "#include <linux/bug.h>" from <linux/asn1_encoder.h> (Jonathan)
> 
> * [PATCH 14/19] crypto: ecdsa - Avoid signed integer overflow on signature
>   decoding
>   * Add code comment explaining why vlen may be larger than bufsize (Stefan)
> 
> * [PATCH 15/19] crypto: ecdsa - Move X9.62 signature decoding into template
>   * Drop unnecessary "params", "param_len" and "algo" definitions from
>     ecdsa_nist_p{192,256,384,521}_tv_template[].
>   * Introduce and use struct ecdsa_raw_sig in <crypto/internal/ecc.h>.
> 
> * [PATCH 18/19] crypto: ecdsa - Support P1363 signature decoding
>   * Drop unnecessary "params", "param_len" and "algo" definitions from
>     p1363_ecdsa_nist_p256_tv_template[].
> 
> 
> Lukas Wunner (19):
>   crypto: ecdsa - Drop unused test vector elements
>   crypto: sig - Introduce sig_alg backend
>   crypto: ecdsa - Migrate to sig_alg backend
>   crypto: ecrdsa - Migrate to sig_alg backend
>   crypto: rsa-pkcs1pad - Deduplicate set_{pub,priv}_key callbacks
>   crypto: rsassa-pkcs1 - Migrate to sig_alg backend
>   crypto: rsassa-pkcs1 - Harden digest length verification
>   crypto: rsassa-pkcs1 - Avoid copying hash prefix
>   crypto: virtio - Drop sign/verify operations
>   crypto: drivers - Drop sign/verify operations
>   crypto: akcipher - Drop sign/verify operations
>   crypto: sig - Move crypto_sig_*() API calls to include file
>   ASN.1: Clean up include statements in public headers
>   crypto: ecdsa - Avoid signed integer overflow on signature decoding
>   crypto: ecdsa - Move X9.62 signature decoding into template
>   crypto: sig - Rename crypto_sig_maxsize() to crypto_sig_keysize()
>   crypto: ecdsa - Move X9.62 signature size calculation into template
>   crypto: ecdsa - Support P1363 signature decoding
>   crypto: ecrdsa - Fix signature size calculation
> 
>  Documentation/crypto/api-akcipher.rst         |   2 +-
>  Documentation/crypto/api-sig.rst              |  15 +
>  Documentation/crypto/api.rst                  |   1 +
>  Documentation/crypto/architecture.rst         |   2 +
>  crypto/Kconfig                                |   5 +-
>  crypto/Makefile                               |   5 +-
>  crypto/akcipher.c                             |  64 +-
>  crypto/asymmetric_keys/public_key.c           |  58 +-
>  crypto/ecdsa-p1363.c                          | 159 ++++
>  crypto/ecdsa-x962.c                           | 237 +++++
>  crypto/ecdsa.c                                | 209 ++---
>  crypto/ecrdsa.c                               |  64 +-
>  crypto/internal.h                             |  19 -
>  crypto/rsa-pkcs1pad.c                         | 371 +-------
>  crypto/rsa.c                                  |  17 +-
>  crypto/rsassa-pkcs1.c                         | 442 +++++++++
>  crypto/sig.c                                  | 143 +--
>  crypto/testmgr.c                              | 320 +++++--
>  crypto/testmgr.h                              | 884 +++++++++++++++---
>  drivers/crypto/aspeed/aspeed-acry.c           |   2 -
>  drivers/crypto/hisilicon/hpre/hpre_crypto.c   |   2 -
>  drivers/crypto/starfive/jh7110-rsa.c          |   2 -
>  .../virtio/virtio_crypto_akcipher_algs.c      |  65 +-
>  include/crypto/akcipher.h                     |  69 +-
>  include/crypto/internal/akcipher.h            |   4 +-
>  include/crypto/internal/ecc.h                 |  14 +
>  include/crypto/internal/rsa.h                 |  29 +
>  include/crypto/internal/sig.h                 |  80 ++
>  include/crypto/sig.h                          | 152 ++-
>  include/linux/asn1_decoder.h                  |   1 +
>  include/linux/asn1_encoder.h                  |   1 -
>  include/linux/slab.h                          |   1 +
>  include/uapi/linux/cryptouser.h               |   5 +
>  include/uapi/linux/virtio_crypto.h            |   1 +
>  security/integrity/ima/ima_main.c             |   6 +-
>  35 files changed, 2398 insertions(+), 1053 deletions(-)
>  create mode 100644 Documentation/crypto/api-sig.rst
>  create mode 100644 crypto/ecdsa-p1363.c
>  create mode 100644 crypto/ecdsa-x962.c
>  create mode 100644 crypto/rsassa-pkcs1.c
> 
> -- 
> 2.43.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
