Return-Path: <linux-aspeed+bounces-4138-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLY5DU5jFmpamAcAu9opvQ
	(envelope-from <linux-aspeed+bounces-4138-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 05:21:50 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC345DED7D
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 May 2026 05:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQFK66gDJz2yTH;
	Wed, 27 May 2026 13:21:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779852106;
	cv=none; b=Xm7UeoYzyTNeYjZ9vH3xCXkV+3w7El+V/Prd6NUZF4g2Fw8mEZ6mEXvW4tkGQI5wuTOvDaIUqi6ieRd0zx0WZrhMPk5/hP9Rbz0VvV0up8h8pQJ2WpD8Ypom4MlSeOx9h8qgqKGBwBawGbkpuktXdxLipMoLpYlPQH0FaWLQ3oql6f8/81ETXyq0IRIhzbl4u4Z5/5mvKg4A+n/1JTjxV4s3xa0vQ4a7uBhCeVHyjuL2jb9N49d54CtnDjBnhZaZJIOdnHGFVAsvNenCCfQb0gU6kWAgNaC8NGQr755sUF3qQX5Vt37qFEOTjsb2wzsx8F8dxDzWfHCZwJw9f2v/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779852106; c=relaxed/relaxed;
	bh=Xzua1hygqM8RuAqAAV48+yyYvIAPfnUqYZRu2TfQ+q8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RHfJarqsmWpjzEhZUGQjPZHmuCQV5L8yUkn/kSchRVnXbFzdH2tJG8dPIRbWuvBgyOunti4zlOkXH7ytsyD4bpJ/CioMZfH6gjbUNaR38XlkBuW/zgVMqxpslNsq4RWCWLKYIo/TU61n/Wlm9FTLkLxK4UWHy9EqOxUUDMERfo+ok0QG9NjcXTwZhxgLrYDT9k1Fg+A1duKocZjuytpa2TWE8qKfY090JaVKixwS32zRNWNCZX13HlUNhKIoGaa2q0L3QxxqRxSOLH4gJVBECRBIvX5PL5Zky21ItvfkwYKCWjnONxsJHiwwzpppEMp9Xmn//VLbeVwpafiaePWzxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Pz8x7EVm; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Pz8x7EVm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQFK622b2z2xtC
	for <linux-aspeed@lists.ozlabs.org>; Wed, 27 May 2026 13:21:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779852105;
	bh=Xzua1hygqM8RuAqAAV48+yyYvIAPfnUqYZRu2TfQ+q8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pz8x7EVmIcrBA2iTj1Djxy+Fbwc0BvS+azjCJJSL0HLnUGZMgut3ibADjcHzAPjMP
	 WTdYKnCv3Bp1sMmMl9mUZ5yoYR9JuvNETEyzGfRE578L1VhH2O2Zuq53V+eZ5npK7K
	 8oMoNDRqp9BmRhvZQtvVzIGRri9cWOa9YBiaKzgme/4wQVw86KsvSoVOx/i8qSs6ja
	 7LrQkvjn1sob4m0XV8aSkE3Qw8BbExXl5U9rscxvM22uE4RbcBVOpBgBMmcDCje8E/
	 NWmXoFHfA1OE/aHYJHVqgL9j4T6j8N3+tUaXCNjhk3UPTYmQl/5ic4KVFY2GcoLyjr
	 vx34ADFD5+E3g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 140216001B;
	Wed, 27 May 2026 11:21:45 +0800 (AWST)
Message-ID: <a25ff66bee5a2047296eb239c10a7ccafc6d0b30.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT
 linename
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>
Date: Wed, 27 May 2026 12:51:44 +0930
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
References: 
	<20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
	 <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-4138-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au,stwcx.xyz];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:potinlaipt@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,codeconstruct.com.au:mid,codeconstruct.com.au:dkim,quantatw.com:email,0.0.0.20:email]
X-Rspamd-Queue-Id: 5CC345DED7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Potin,

On Sat, 2026-05-23 at 10:28 +0800, Potin Lai wrote:
> Fix the GPIO linenames for CPU_CHIPTHROT signals.
>=20
> The signals were incorrectly marked as output ("-O") while they are
> actually input signals ("-I").
>=20
> - B0_M0_CPU_CHIPTHROT_L-O -> B0_M0_CPU_CHIPTHROT_L-I
> - B1_M0_CPU_CHIPTHROT_L-O -> B1_M0_CPU_CHIPTHROT_L-I

I dropped this list when applying the patch because it's evident from
the diff.

Andrew

>=20
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 61dbef45f8b0..d7ed497d7227 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -224,7 +224,7 @@ hpm0_ioexp_20: gpio@20 {
> =C2=A0			"B0_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B0_M0_RUN_POWER_EN-O",
> =C2=A0			"B0_M0_RUN_POWER_PG-I",
> -			"B0_M0_CPU_CHIPTHROT_L-O",
> +			"B0_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B0_M0_SHDN_REQ_L-O",
> =C2=A0			"B0_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B0_M0_CPLD_READY-I",
> @@ -398,7 +398,7 @@ hpm1_ioexp_20: gpio@20 {
> =C2=A0			"B1_M0_LEAK_DETECT_ALERT_L-I",
> =C2=A0			"B1_M0_RUN_POWER_EN-O",
> =C2=A0			"B1_M0_RUN_POWER_PG-I",
> -			"B1_M0_CPU_CHIPTHROT_L-O",
> +			"B1_M0_CPU_CHIPTHROT_L-I",
> =C2=A0			"B1_M0_SHDN_REQ_L-O",
> =C2=A0			"B1_M0_CPU_SHDN_OK_L-I",
> =C2=A0			"B1_M0_CPLD_READY-I",

