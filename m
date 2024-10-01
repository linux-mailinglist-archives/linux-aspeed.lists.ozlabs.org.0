Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0898B856
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 11:29:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHt254sDxz2yMF
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 19:29:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727774986;
	cv=none; b=EY73jVZ1gasPIi/mCojjw7nCHY7ehH8X+4d0vdv2MZyOwqpADV8envPoi9NO8BbAUQiJWE9fOeaUhGpk98yITejfRHxUni7MKhg+OCNA3xparIvOWM7Qp7MdSuzQUNpCNtoXxmkISDYibsroy6HbZzHyiVGcUnE4yFo37veDxL0C3zDBs+Bswf2y+yt2QMfT+4d5Nck7dpiCb7J48MT6mA6eHTUBMwlLtOkn0OnoziUf1QXMKmp6M4CY0KryIC12q0bzJMuwb8aUDhrrcmahmGav66ZOUl73ed5KiAMowNqEoIwb6xlYmNITQnMSeLm4Qik6i3uvR6g3TH4g5uaTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727774986; c=relaxed/relaxed;
	bh=rw1k8Bxgz1nx+72kq44BAQqm5kyGv9qQwzqB500+C4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAOZCKwTf/iTTKzLWVUDbQqJ9FlhxHdkNST8GzI7dVzivQnUgDGG4yirmA4NhyHK3QlsUF1DU9UxhRz1grYwZpciCUPSjORdc7AAaEd3m3c3/WUNMiuT6NL4q2xzTaitZ+Unr8EAoAv87ZjMvfpcba87VfkPw9/VLV5ZlllKoaAeAy6k00S2V2U0MARHH/UVQxFv2ARfzgyA29R3lq5Mt+jIjiGhguYMUl32WFh8xRl8hP4xmQbi2ukucFqv2f+nHm7zS5EUqjUZegkDLXZGP/6qhABy/Cz01j6i54ZI38oDOzlTumqRNEj4WYqYS9tuoCJvj528NkyxlPNPH5ARHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 735 seconds by postgrey-1.37 at boromir; Tue, 01 Oct 2024 19:29:45 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHt213DF3z2xy6
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 19:29:45 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id A75BC30008F12;
	Tue,  1 Oct 2024 11:17:13 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 89069230E25; Tue,  1 Oct 2024 11:17:13 +0200 (CEST)
Date: Tue, 1 Oct 2024 11:17:13 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Subject: Re: [PATCH v2 00/19] Migrate to sig_alg and templatize ecdsa
Message-ID: <Zvu-GV-vtDJHKf51@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
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
Cc: Zhiqi Song <songzhiqi1@huawei.com>, linux-aspeed@lists.ozlabs.org, "Michael S. Tsirkin" <mst@redhat.com>, Stephan Mueller <smueller@chronox.de>, Jason Wang <jasowang@redhat.com>, William Qiu <william.qiu@starfivetech.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, Ignat Korchagin <ignat@cloudflare.com>, Longfang Liu <liulongfang@huawei.com>, Marek Behun <kabel@kernel.org>, Eric Snowberg <eric.snowberg@oracle.com>, Jia Jie Ho <jiajie.ho@starfivetech.com>, lei he <helei.sig11@bytedance.com>, Eugenio Perez <eperezma@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Varad Gautam <varadgautam@google.com>, Gonglei <arei.gonglei@huawei.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, Andrew Zaborowski <andrew.zaborowski@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Roberto Sassu <roberto.sassu@huawei.com>, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, Denis Kenzior <denkenz@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Herbert,

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

This series was submitted at the tail end of the v6.11 cycle.
It still applies cleanly to v6.12-rc1 though, so I'm not sure
whether to resubmit.

Is there anything you want me to change?

Thanks!

Lukas
