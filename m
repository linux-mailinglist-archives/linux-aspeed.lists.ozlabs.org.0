Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F418A4694
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 03:34:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lDgqEDHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHqTH3Svbz3dVm
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 11:34:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lDgqEDHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHqTC0LXDz3by2
	for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 11:34:06 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7F48F20178;
	Mon, 15 Apr 2024 09:33:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713144841;
	bh=WGAdQkTH9rCbCFpFlh1ykbW/XFvwiK0fk8p7CK6ZRBM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=lDgqEDHAg1RXJVPjPJsL1Nipc2p5NibKJpJLBhuB7aGfoxPFDDAk3AwqR0iaipjik
	 JjJEenbSECxVoK7JgRvf7DXiZDpPc/0RsEYJLaX2gLgHiAJs1aQGyCSSve+3sRW3Ab
	 gaLxVLXU/DDPM1gUVnkg7W7CzeXWY60W3c6vCSMDRm7iCumOJigi9dED7PqDyX1JQC
	 cZo+bPjKv5/Ge5tTW2foG7LmNMJ69Y/09FkhTAZfFmKwi2AkX1gOCTM02GKhu+cn5/
	 wB8KySadAPnP2UoWH1PUI599p3/gKg/5d3cnzTo33CzTUnceGXhtmC0DXKtSbxHhIN
	 ZO5z+wylMZ3UQ==
Message-ID: <7af48dcfba938ea45a78e8a23088a09a8eeeabdd.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Remove Facebook Cloudripper dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: rentao.bupt@gmail.com, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org,
 taoren@meta.com
Date: Mon, 15 Apr 2024 11:03:58 +0930
In-Reply-To: <20240411045622.7915-1-rentao.bupt@gmail.com>
References: <20240411045622.7915-1-rentao.bupt@gmail.com>
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

On Wed, 2024-04-10 at 21:56 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Remove Facebook Cloudripper dts because the switch platform is not
> actively maintained (all the units are deprecated).
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

I've applied this to my tree to be picked up by Joel.

Andrew

PS: Sorry if you already have mail saying as much, I ran into issues
with our mail server late last week.
