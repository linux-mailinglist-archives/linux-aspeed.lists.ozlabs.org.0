Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF68683BE
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Feb 2024 23:29:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XBlCq1DE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkFdx366cz3d2S
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Feb 2024 09:29:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XBlCq1DE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkFdq0m00z2xXP
	for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Feb 2024 09:29:02 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0645720127;
	Tue, 27 Feb 2024 06:28:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708986539;
	bh=8eEw/FtaaqWX/jVY5OVj7vtAlz28XQ3GCy3aQ75fMEc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XBlCq1DEyt1YVQIrQWcOGMdZNCgE4w/xv4+a5wqpEiRCjnKTnasyBg//tPzMkesFu
	 OILCdfmqH9X1RCfZ1SN9zNaCARMT/sB3IO58WyUKoHmLfCMl8QIYtp2qt2lSootyW+
	 /hdBMOBZ0cgiOyl978UBaqVV13gT+mca0bkKhBxd15+1dDcpYg/VrDLVfHyHJhWUQc
	 pD5t+Brn1TewzecmHZFl2kpVnBbPY6JpFOEHBsfmuLUmWMXeFTPTfabdwQC32xk6u8
	 cx8gWGIJzWGwVASAbrtEuoS0pTDUiRSDwU+Ef/49Ky/RQCAl2BtuVug+WjKFYkBsdd
	 Ka47d+jW2KUgA==
Message-ID: <afee602b57f95a2d3162a601832d3a087ea5f0d6.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: ahe50dc: Update lm25066 regulator name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Date: Tue, 27 Feb 2024 08:58:52 +1030
In-Reply-To: <170896502304.859066.13236138723073669130.robh@kernel.org>
References: <20240226091754.16027-2-zev@bewilderbeest.net>
	 <170896502304.859066.13236138723073669130.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-02-26 at 10:54 -0600, Rob Herring wrote:
> On Mon, 26 Feb 2024 01:17:53 -0800, Zev Weiss wrote:
> > A recent change to the lm25066 driver changed the name of its
> > regulator from vout0 to vout; device-tree users of lm25066's regulator
> > functionality (of which ahe50dc is the only one) thus require a
> > corresponding update.
> >=20
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
>=20
>=20
> My bot found new DT warnings on the .dts files added or changed in this
> series.
>=20

For what it's worth I've put together a set of patches that resolve
almost all the warnings in the Aspeed DTSIs. My current approach is to
progressively send them out - I'm starting slow so where possible I can
avoid making the same mistake multiple times.

Andrew
