Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753BB50C04B
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Apr 2022 21:25:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlPWW2Gn9z3bcG
	for <lists+linux-aspeed@lfdr.de>; Sat, 23 Apr 2022 05:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tDLCgpzd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tDLCgpzd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlPWR5Jx3z2xKK
 for <linux-aspeed@lists.ozlabs.org>; Sat, 23 Apr 2022 05:25:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 821A361D4F;
 Fri, 22 Apr 2022 19:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B088C385A0;
 Fri, 22 Apr 2022 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650655519;
 bh=WYqnuhXjI+/exhaILQxhAiYQgAemTlqPINtEIH6j1CQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tDLCgpzdk25UmYaYYQWNuuMTHiodmybPYVgnllJRpzph3GkvCXhAymiuQFmDf9tb4
 wq/rp8GViY1G3sBZpDRpBNH27jZqSwjw1zCkecvIHaUQvkfNSSaPO0GIVH2o7am0lZ
 fKonI5zfaeVtR1tWBw28+pbXthudgjVXU+uR4P7Jz7wF8ROh1TpJaiOnoaccNaSIs5
 qzKOur5UE6yha/e2xTHQqnibPyRMK6tB4zusU8N9hvKwN9qJwndldGV74eDy7TIBby
 ejnLaAZC65Yb8ZiXxK4cofso6jSpTcIs8dzRSHsYzmkQBUhw+SQrq4g8CP6ykvwCy6
 LRbtDNkY+7o+Q==
Date: Fri, 22 Apr 2022 12:25:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH net-next RESEND v5 0/3] Add reset deassertion for Aspeed
 MDIO
Message-ID: <20220422122518.347d7779@kernel.org>
In-Reply-To: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
References: <20220418014059.3054-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 18 Apr 2022 09:40:56 +0800 Dylan Hung wrote:
> Add missing reset deassertion for Aspeed MDIO bus controller. The reset
> is asserted by the hardware when power-on so the driver only needs to
> deassert it. To be able to work with the old DT blobs, the reset is
> optional since it may be deasserted by the bootloader or the previous
> kernel.

still doesn't apply cleanly to net-next:

$ git checkout net-next/master 
HEAD is now at c78c5a660439 dt-bindings: net: mediatek,net: convert to the json-schema

$ git pw series apply 632891
Applying: dt-bindings: net: add reset property for aspeed, ast2600-mdio binding
Applying: net: mdio: add reset control for Aspeed MDIO
Using index info to reconstruct a base tree...
M	drivers/net/mdio/mdio-aspeed.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/mdio/mdio-aspeed.c
Applying: ARM: dts: aspeed: add reset properties into MDIO nodes
