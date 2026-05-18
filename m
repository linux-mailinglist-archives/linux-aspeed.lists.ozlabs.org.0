Return-Path: <linux-aspeed+bounces-4061-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENtZAUP6CmpF+wQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4061-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:38:43 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8756BB34
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:38:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJwmb6Zrwz2xpn;
	Mon, 18 May 2026 21:38:39 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779104319;
	cv=none; b=U4ImtTXtsBNDYj+yxJ2vvibLDLs7uV9+jY20eZ29Qhe+IU/svKHLLoBcyTlw3XWFFBPpA9D5wCRiHYMbe5w4to26tNrzpbeKTuXB3f4mTpFzGBKIaA+Dr1dtFoEKJ/AhwoC3dusoqdVO4NRGLBYtCYGt4mng/3kORgeb2NMq4V5WxGvsXhNzXGfJQO/1CZH5hLsergXzv9GuGaHO/x4XeqKAFC8bIsPCJFMzb/edH8ge1B6FgN82B6iJarQJEztO7Q5a59eTfHcexV8eLFQ0nPj+jjvWRjACDXG/DhJYW8eFVyoCsn+dGEmbepGmCUrVK3w97cJt3O65hVz+fc9qVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779104319; c=relaxed/relaxed;
	bh=nzsDWOOYvpaUy8TXIH2yV7CTdJ93Ilwd3B4S+TiEyrU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TINVQbGfog4rtI0XPHKLyGhMgVuAairczAWiaJC1kwwVpSfgCPVHb+hqzALhVlDtPog92mqf0fxfk62YOu+bt7P+LpnOQmKVnukpODoLtx2fCFKVQQGiNNErHHsCjhPRShLowGNZ04qJTiotqidf19IfF0dvpzoYxxfefXGr98/XrqMlk5kWOkLjEa9jc8sMDO2G6iLsVCIxQLo+54G1T2kIBCT5I9b5ALDOtxPYWAmlCy0OtJ9OBdGiQOdbbXEvQKxfsO0A1uelaJIp8jn6e63MdAc8D6pd+QtARX0dhIcWYAewYBxd2pL4L3aj3KupmPxblEPtfLzACSV8TRXXQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Z6pBIkpg; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Z6pBIkpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJwmb3KjHz2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 21:38:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104318;
	bh=nzsDWOOYvpaUy8TXIH2yV7CTdJ93Ilwd3B4S+TiEyrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z6pBIkpgVu7nBeQyqo8FXqPA4g6Igx7OajR/dadXsp6OogcgWVhRx4wZ28No1SQTd
	 lRAHCuby8EYWtCq4wI11yf6rNXUpehbiilnIkoZvZzxJwRVh9ep5FcxMPRNBoPYzhU
	 lGFNBMvANxjU9q+4x7RRYR5IDDStHPDlqYkQ1cuK45Mz4lXVvtLvbVhyTTXAVjlSTS
	 Q/iFw7YKvgq4ZUJSTMMEOSR6sLLDEUiiSwVQUvuaJL5fOxeUGKc1oa5mfcCrSgPt/2
	 Qx2T9cg7QA54QEL3Ot6JZHQJSzWgB7uxD6x8OpWrSLwQdLUVSCuPNRYwCgOOTOVz1H
	 +sCDeIZXrjWBQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B0D66024D;
	Mon, 18 May 2026 19:38:38 +0800 (AWST)
Message-ID: <26a62f67c2aa5fafb019b59893d374047d2f5e70.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/7] ARM: dts: aspeed: system1: Enable video engine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>
Date: Mon, 18 May 2026 21:08:38 +0930
In-Reply-To: <20260421224551.1611818-3-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-3-ninad@linux.ibm.com>
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
X-Rspamd-Queue-Id: 2BE8756BB34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4061-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ninad@linux.ibm.com,m:eajames@linux.ibm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:manojkiran.eda@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:manojkiraneda@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
>=20
> This patch enables the aspeed video engine support in ASPEED BMC for
> IBM System1. It is crucial for facilitating the BMC's video capture
> and redirection capabilities, which are integral to remote management
> and KVM (Keyboard-Video-Mouse) over IP functionality.

This is a real nitpick, but: The commit message seems a bit too
grandiose for my tastes. Can you make it more succinct? Writing in
imperative mood to avoid "this patch" is generally recommended too:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

Andrew

>=20
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 488d0b3916a1..0ca799893791 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -531,6 +531,10 @@ &lpc_snoop {
> =C2=A0	snoop-ports =3D <0x80>, <0x81>;
> =C2=A0};
> =C2=A0
> +&video {
> +	status =3D "okay";
> +};
> +
> =C2=A0&i2c0 {
> =C2=A0	status =3D "okay";
> =C2=A0

