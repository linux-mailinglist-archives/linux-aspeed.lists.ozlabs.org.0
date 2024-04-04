Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A5897D5A
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 03:17:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C7w/5INM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V93dc551Mz3dXQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Apr 2024 12:17:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=C7w/5INM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V93dW01SFz3btl
	for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Apr 2024 12:17:50 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB38C20172;
	Thu,  4 Apr 2024 09:17:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712193470;
	bh=AnZy1ul9z22wLV53sWsuV/QLH4baWunjG6AMLZ7wkaE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=C7w/5INMzf9doVl0bXoxlonTUfuLxaoa0qEhYhcoJ7nRVWjtwpusMfDVmGMFfl+sZ
	 Gn2mVUSGFpGWgHBi/s8l0kMXpL0k+aFdGA25ZQ0K4HrvwaFqlUj5dhIO6f4+l24LQi
	 mdQkJ18moNCE/X6VGdnL2UgMSMS/J1hPM8Vhg1ofpiRLjnxxbjUmmZpzexQbdn4zm2
	 rg3LUl2DyrcFfBg+pmVamLUY44RgJuxvCvGZ3TKUQm9fsqTNLPOmWbGSZXHN40jwDc
	 2rE6kcULCi3NSPh6vAajadYiY73FuQI+vyAk0mhb1ij16iOes/VtcCcLZyE/k8APSI
	 AF07bWtSMGCsw==
Message-ID: <77829355a18f2afd64343e7e19498473d9263ef6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/3] ARM: dts: Modify GPIO table for Asrock X570D4U
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Thu, 04 Apr 2024 11:47:38 +1030
In-Reply-To: <20240403133037.37782-2-renze@rnplus.nl>
References: <20240403133037.37782-1-renze@rnplus.nl>
	 <20240403133037.37782-2-renze@rnplus.nl>
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

In the future, the start of the subject should also include 'aspeed: ',
so:

    ARM: dts: aspeed: Modify GPIO table for Asrock X570D4U BMC

On Wed, 2024-04-03 at 15:28 +0200, Renze Nicolai wrote:
> Restructure GPIO table to fit maximum line length.
>=20
> Fix mistakes found while working on OpenBMC
> userland configuration and based on probing
> the board.
>=20
> Schematic for this board is not available.
> Because of this the choice was made to
> use a descriptive method for naming the
> GPIOs.
>=20
>  - Push-pull outputs start with output-*
>  - Open-drain outputs start with control-*
>  - LED outputs start with led-*
>  - Inputs start with input-*
>  - Button inputs start with button-*
>  - Active low signals end with *-n

This seems to be a bit of a mix of following conventions in [1] and
not. It might be helpful to weigh in on that document with your ideas.

[1]: https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-n=
aming.md

I'll put this series in a tree for Joel for now though, with the
subject fix mentioned above.

I've also re-wrapped the commit messages as it seems you stopped a bit
short of the allowable line length.

Andrew
