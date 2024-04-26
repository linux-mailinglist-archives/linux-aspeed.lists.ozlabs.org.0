Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E688B2E2F
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 03:00:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wv4FMbZ5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQZCP2Dt0z3dLY
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 11:00:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Wv4FMbZ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQZCK0213z3c4h
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Apr 2024 11:00:28 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9D43020075;
	Fri, 26 Apr 2024 09:00:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714093228;
	bh=cRoZePRAKHr699wCxkb13i+8DqCx1aRTztutQ8i4STc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wv4FMbZ5y7oQ4w6gmISe53fWyR1AsCJyruMAfpLhvWBUXmbDsZkiLCuZXtZkqah43
	 4m/VOIs5N+ndo+leLMuI2E+jxFFrcjIBo3Ma9GreaZjxRNXYhF8bkVp6qke8ACRPba
	 HYvFtAXK0p0ILN9G4H9S/sKnmL3efsQmeCikSZ6yQ2YUyK/iGGSUKhkwq7npA6FwOn
	 QQ5NaKf8Tbail11cegjWHNMnF3B99vBXwAsPtySAPldtmIZSE+PmKl4I31es/RzCv4
	 w1I1CSgS+MCVe26T879QIuUz7OIYAWaAE7y1HP29A/zLD7EpJNV6/hm/IEtq3rWdj9
	 D4P2fow17rQYg==
Message-ID: <eb02333de3bfcfef586f393141d5aaf039889e7f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add vendor prefixes to lm25066 compat
 strings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>
Date: Fri, 26 Apr 2024 10:30:27 +0930
In-Reply-To: <171394189432.44668.6061047707500811188.b4-ty@linaro.org>
References: <20240224103712.20864-2-zev@bewilderbeest.net>
	 <171394189432.44668.6061047707500811188.b4-ty@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-04-24 at 08:58 +0200, Krzysztof Kozlowski wrote:
> On Sat, 24 Feb 2024 02:37:07 -0800, Zev Weiss wrote:
> > Due to the way i2c driver matching works (falling back to the driver's
> > id_table if of_match_table fails) this didn't actually cause any
> > misbehavior, but let's add the vendor prefixes so things actually work
> > the way they were intended to.
> >=20
> >=20
>=20
> Two months passed, no replies from maintainers about picking it up. Dunno=
,
> looks abandoned, so let me grab this. If anyone else wants to pick it up,=
 let
> me know.

Sorry, another one that fell in the hole mentioned previously.

I'm okay with it going via your tree if there are no conflicts.

Andrew

