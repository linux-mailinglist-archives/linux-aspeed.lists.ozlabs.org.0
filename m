Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146C97C2BC
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 03:59:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8JcX2LGBz2yFL
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2024 11:59:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726711194;
	cv=none; b=nVIAyAPI9NalPLIoxruwlq+7qbimCjwUmXUEGUjLMegyC0zgLJrxxl7ueQ7uewY2ITJXbMhmjw9VtgdD4Qxp3SK3zRNTugZNcBtX9sh/9Guse1Ql/vNmODSnTCSsGe+MTXjm3WEsAjuAz6PE6zECHrLDqH4QVw2WePkvYe4A2sgieZ/9YEHWlJyiHTn9eGysYdj4tj0AoanDw2O9ZgMPgSaO+mlBSsqtZDPa4asCluEidZ1ZqpYWRt5mzmk+mkR1jotr5rkckX6LFUmCLbJ4c1L5Rj69//tWcJemhnAEsSlg1hbsVfgOq+CB+qkrCrp0F+6iq4UXTlyu5zrI+oNs6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726711194; c=relaxed/relaxed;
	bh=xf/mEOumj8cpcGVjlVEJWxcLHn9GgqGfR5C96mEP2rA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZBglxPrEw1hJXPl97wdgPj3bykXENg4IcU2VSh6HfYhoi2B3QuqO+20BVky4XwQRhG6cxac4kXdqjJQlzY6kokfl1snosF3sFFER9zOr/r4+6pLQf9o39b0AoyVpQT3iwDg/sCA/tis2O/PVa6D9DWRmHEPSB0CuCqJ1D4pOZ0s/OAU+m3jAbisJOB/Vj2AImu0n9nk3T0kHFG5CNEuXRgtn138fUS+FoYuFYqfMS9aZdHu/8EBOV2y4SLW93s09nDTBMI6O6McM8dxW/0z0SaqcgnpHYmP7al8EIK+KIC4YehpmKZtHi9vzcWvMZLHTs3KJ+6gf8uTvIDIpJju1rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aFjCTQzF; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aFjCTQzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8JcV13s2z2xcq
	for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Sep 2024 11:59:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726711193;
	bh=xf/mEOumj8cpcGVjlVEJWxcLHn9GgqGfR5C96mEP2rA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aFjCTQzFIekzTuYw7VbNuDar0cAssOmRJigdJCAOtgRn/9RPVMxjBnqwfTWx0iwBg
	 hfrTFIbV2Q/RWP6iEigFAQ1vLdSVrd9bvh/EBksd56JmeXNFS4Ih6ctmYgCiaTw7mU
	 5lWSy72sySrU/nsIBywD8VfTvJ44ZM+OAPK5mG0Y49VJZiyRsC/DLBtzoNKnZblSyN
	 nexqn7PAbBKPpn/l0lCv6ecVupnQJY1z7l0FSSnlqvfDQY3hidqnHXDh0L0gBfdNdh
	 SUBgVR1kykw3g9KuJ4MM4wEBrHSlMgY9lRsqf/jkkfmO8us8i/4jCC7L/jkDqMjR4h
	 dlm2gsiJzwH5Q==
Received: from [127.0.1.1] (ppp118-210-188-185.adl-adc-lon-bras34.tpg.internode.on.net [118.210.188.185])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2583C65027;
	Thu, 19 Sep 2024 09:59:52 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910054751.2943217-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v1 0/2] Yosemite4: Add devices on I2C buses to server
 boards
Message-Id: <172671119203.649222.5621392370744640415.b4-ty@codeconstruct.com.au>
Date: Thu, 19 Sep 2024 11:29:52 +0930
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 10 Sep 2024 13:47:49 +0800, Delphine CC Chiu wrote:
> Changelog:
>   - v1
>     - Revise to use adm1281 on Medusa board.
>     - Add gpio pca9506 for CPLD I/O expander.
> 
> Ricky CX Wu (2):
>   ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
>   ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

[1/2] ARM: dts: aspeed: yosemite4: Revise to use adm1281 on Medusa board
      commit: 4c417a6b31471da78b87f9e542f285e2225744e0
[2/2] ARM: dts: aspeed: yosemite4: Add gpio pca9506 for CPLD IOE
      commit: 00f897797acf562bcbda20d8ca93f279a0c6bb5b

--
Andrew Jeffery <andrew@codeconstruct.com.au>

