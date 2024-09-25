Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F68984F8D
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 02:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCygV6yTKz2yXY
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 10:45:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727225105;
	cv=none; b=DZ8AIMryfBJ9txicc1kMScrnzBxco17N3qmSpFy7JVXRE916M9giuGyPHXL/FlOAeacwFioNCkxK9iCpzYNHEEShV0vduu5q5aj4jHf5mg+x1aBIzUNyJRRBLyM3dXFiRgCC2d1YSzBi7fHeKD1y01lhQn88Gplg0kxHVHgmu2m/nhFzTfFrBQylXxmCdVznQKHmzkcpxMzTEkTamkMu9XjkH3gaAn72HJK7F9lVZnESo6hce8PCAthLb6FUaGygla4m/iaAcxmSFRDEGddZfSHf4LaUIcmgSx3UicXsP39WJPWJ4O107otmwL5NPO1neptkSAu9+yxtlgfInEzJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727225105; c=relaxed/relaxed;
	bh=z7YwqmSIkfJy5eX2ybGSz+Sd5B75kF2SWxpx8EP5VkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VLtk4GL4ckB3jir6FbhNHmuswYH1wu2uNyV+0p+U1Ue2KNJfEgPvmm/DU5VjqlTLnaQhmKC1HMW2MseCg8g1p+7N1ZmDKwUEwU360ZWlbV4m7ohJ8Tpc9oWBZdidMZjaLZcKdhSRUp/KUCLPlvPjCOS81KYKyy98ABFcxqvXiitVlAr/gcMbbQK+mT2pvbE18DzKbfQObyPp7RyG1okcQ8izkGNfPCKPOhyrQ/FZgTcsf++HOXaX1HNB67qxczeJqbHiMksCh3Qo17XhUsRxo0ddhzOzJyBAPQd+KeKy7ue8qKGMaLS8pzbKKunr80kzy7aQoPwsaMi5Z9dYpcBcxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=asfP+YMH; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=asfP+YMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCygP383Dz2yHL
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 10:45:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727225099;
	bh=z7YwqmSIkfJy5eX2ybGSz+Sd5B75kF2SWxpx8EP5VkI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=asfP+YMHmfgGOL0ZsKC7bu9cAqOPlM1ZiPn5BDumFOYtrQvxfe/F6/6V68J8OIFWE
	 k5YxDKMdCs1vQUNf8NKcQe1l7IF7yHoMlrxCOGHD4Aro4WbMtZnV9ntjVnrqoGYTQf
	 Yku+tGJ0FUEVZ7ZF/KKtpZqcAHbn2lBr4XrSoSE/Wh7vTPWK0yjmHJTnaTsfUgxRnP
	 0zHgDiy52qfViLTJp/6rJjXEVl+/LEL7uQuknFbAY01hnhdlc1OsiMqr0CQosc5OOK
	 ttqZ1rsBYzT5zIuQ+WAy1+Io4TBW4Biqx31QY5uBQIeTiXCAAcj6Tkd2gx1n/voEl2
	 BXGs16V86CNrg==
Received: from [127.0.1.1] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3E81C64C85;
	Wed, 25 Sep 2024 08:44:58 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, patrick@stwcx.xyz, amithash@meta.com, 
 Yang Chen <yangchen.openbmc@gmail.com>
In-Reply-To: <20240924140215.2484170-1-yangchen.openbmc@gmail.com>
References: <20240924140215.2484170-1-yangchen.openbmc@gmail.com>
Subject: Re: [PATCH v1 0/3] Revise Meta (Facebook) Minerva BMC (AST2600)
Message-Id: <172722509817.374662.7338401100529556748.b4-ty@codeconstruct.com.au>
Date: Wed, 25 Sep 2024 10:14:58 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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
Cc: Jerry.Lin@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 24 Sep 2024 22:02:12 +0800, Yang Chen wrote:
> Revise linux device tree entry related to Meta (Facebook) Minerva specific
> devices connected to BMC (AST2600) SoC.
> 
> Yang Chen (3):
>   ARM: dts: aspeed: minerva: Revise the SGPIO line name
>   ARM: dts: aspeed: minerva: change the i2c mux number for FCBs
>   ARM: dts: aspeed: minerva: add fru device for other blades
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

