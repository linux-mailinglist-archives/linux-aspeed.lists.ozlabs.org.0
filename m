Return-Path: <linux-aspeed+bounces-4297-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A1DgLwqFO2qdZAgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4297-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:19:38 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C87856BC19B
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 09:19:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GTSKtRDR;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4297-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4297-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glYGb4hcKz2yYy;
	Wed, 24 Jun 2026 17:19:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782285575;
	cv=none; b=f9hmRB8OOYgVWhcGgce7CRhph/7QBxMU6O+eP1cRjH6VstV9tQFnX6pcx3pgcmw4hZQSZdJe1jDb7kipmRD7NGAs80LBLhRcit9qH4j6mqxI0tfjK7Rtb5+6Ly3KW34SeRkG8R1bVfvMmhxpYewGRCnPjZB2aKn9TDbirq1Yg1shhgvIfZHR4KskPPn57FT8PGubqpu/xF4YPwOnQzucr8YnKIw7z3QTiusdxpvvaMYWBtGBorYZKdUyOnVn5Sup9ceHBubVb9ZBhpKRvzK8nLBq0Z1sEMyP7Co6AwbI0JJ/92QimtrDqMF3xKUQWrYiaQFWtQgzeBmAsDCeykZbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782285575; c=relaxed/relaxed;
	bh=GwssO+47QsRfChEGZdtxq4U6eIg1dC3mtSSD7D78Iho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OidHDAeqLpHmZTIClZ61OjCL/Oc429ivvSA6RqBJAv2UCCoBtqkA4pWFS2uvUA07kxNWRsLnECDrhIOXcRYD6wGVgzHg6ht1bmuz99b1bg/891B3jEmFjEPdDQ2MHmRSZrHglbOJhBx0mJzx6Cgp5MFHElREieaMYskwNOFgkCO4n83oi7v78Qicqca5uOD/k+tSi6mAgGIm1qYpU/yggm2r3hq9dKw8KfNq3Gu9kxPR423nMOLnYYdTuj6JaEbpv/bn3RqS/iJAmPxZ1r6ZzNqH31M9wyKSF/VIz6Xq1VBEfR0H3Qtr0uOQaMlKiGEchS1zxCbe77LQbDUXy0V+9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTSKtRDR; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glYGZ5FTzz2yYq
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 17:19:34 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2550C43A08;
	Wed, 24 Jun 2026 07:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CACA1F000E9;
	Wed, 24 Jun 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285572;
	bh=GwssO+47QsRfChEGZdtxq4U6eIg1dC3mtSSD7D78Iho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTSKtRDR6CR2tM9kq4Uwbmjs3NPP2dXNmDh4Y0tQctdlO9Gg4BkKyZshlsX5TIrFV
	 B/bTxNwfTo3Sk2NOrtd5qY1CPkos17mbzuUmMFUsSpELWUUfzj/bJK8MDCLWftHH+J
	 v7Z046URD6DHJEOtTQPtUwy6ZXh9rSavoy+zwlcvn37D6me0fy34X1160PqhHMOZRn
	 K3dfuHLFLgSuMZgv5DGH329hYQtbOuXlX4safZpidz/ngLGq8JK4ydCLRxc9qKB0sp
	 +yiKxPzX0rMPSaJ7ymGlOO5VvzMZysxpBQmc96uQmi0DV550ssAZ9SMpU+bVZPyEKs
	 TZPh4gvnoTejA==
Date: Wed, 24 Jun 2026 09:19:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
Message-ID: <20260624-copper-albatross-of-youth-6abae8@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4297-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,9elements.com:email,linaro.org:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C87856BC19B

On Tue, Jun 23, 2026 at 02:25:44PM +0000, Gr=C3=A9goire Layet wrote:
> Use the ast2600 compatible string.
> This makes it more precise and enables specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..7c02633f2bd6 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
>  			};
> =20
>  			vuart1: serial@1e787000 {
> -				compatible =3D "aspeed,ast2500-vuart";
> +				compatible =3D "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";

Please start testing your patches. This for sure fails tests.

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=3D1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sourc=
es-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


