Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9A8962F1
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 05:29:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WM/sePX4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Vby3RgBz3d28
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 14:29:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WM/sePX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Vbt22dKz301T
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 14:29:30 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BF8CF20075;
	Wed,  3 Apr 2024 11:29:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712114969;
	bh=1EIgt9ACWXed19+CaCKn14yKWR326KDE1bbmos0k4nQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=WM/sePX4JC/BBusJTYbStdbfybWmQb6z2+R9oPr1BMeNxlNrdw5bi0fYd8PdI7ycT
	 6H8szIlqqZs8NWFXbe+6ZCHY0l1gcQwuzTnIja7f46/h26kG7rDSwKcDIp3dJvODGg
	 XXO9GKtObUHJCX4YPJXN5FllsBTKhoiVzBbfJcL8lM3JUW6x69IEjM8tuqrUDXYCd8
	 7OCM/5BxRwaaEsLPMsoamm8Qd1pQi92Vl/aMhPujUv/rXA3+u67j+pQLEwofxC66w6
	 /pDKlcOnnUDt9pR+0w94bfUgsOXdlCnLHazyMvuNUIoCl/SAL7OJghdsC8Kd1pDjko
	 lHGvD8/TY40/Q==
Message-ID: <42e91dc2bccdcac96abd729def8a05b2612488a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/3] ARM: dts: Disable unused ADC channels for Asrock
 X570D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Wed, 03 Apr 2024 13:59:17 +1030
In-Reply-To: <20240329130152.878944-3-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
	 <20240329130152.878944-3-renze@rnplus.nl>
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

Hi Renze,

On Fri, 2024-03-29 at 14:01 +0100, Renze Nicolai wrote:
> This commit disables unused ADC channels and labels the ADC channels used=
 with their function.

Please run this through checkpatch and address the warnings.

Also, the submitting patches documentation[1] suggests using the
imperative mood - instead of "This commit disables ...", use "Disable
...". The change subject is phrased the expected way.

[1]: https://docs.kernel.org/process/submitting-patches.html

Taking the subject and the description together, the description feels
a little redundant. Maybe it could be trimmed back to

> Also, label the ADC channels used with their function.

Andrew

