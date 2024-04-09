Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138989CF4D
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 02:24:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OiVgccSa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VD6Cg0CjJz3dSp
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 10:24:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OiVgccSa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VD6CR3bw5z2yPq
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 10:24:19 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A5E392012B;
	Tue,  9 Apr 2024 08:24:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712622257;
	bh=TDqjYQpAoBvvxb2GvP4NCr3jQj38qfOgENS8D5J1+hM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=OiVgccSanJ+IFa3zzeSMINjq9hzETr6UDaT41Y4dk/scogRYDcAdUply26E3036Rt
	 0Wt9hLdPJPTbiMlvAZ1YphBdgEXkifqtpR5aC2P+x8E2UUCV5RFAzVVCPYiwfEM/2K
	 oPmLTU8hQcPrVjtNiqfBg4GHShfIs/LCWO9Y3Tsngh//cGU3OAAO7jAfqdtc0lHznm
	 FxuyAC/zfarqWt/6cNWWaRHuDVFiPz4Z6ZJFIwKTs8+ApTcds+cOIiEcWPSH8lC4RQ
	 A99RDm8cRZH85GrqGEd2Jekkhr3rjcn2E+E9znXYOM97nD/S7d+1su4Qp2gp09jjVl
	 ZIupyup7lZoXw==
Message-ID: <3f440c4347dd04c79969cc9fb16254146ef202b1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Apr 2024 09:54:10 +0930
In-Reply-To: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-04-05 at 08:46 +0200, Krzysztof Kozlowski wrote:
> "mlx,multi-host" is using incorrect vendor prefix and is not documented.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Thanks, I've applied these to my tree to be picked up by Joel.

Andrew
