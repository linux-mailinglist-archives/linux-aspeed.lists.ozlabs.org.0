Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B4D45D140
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 00:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzy1R6QQbz300S
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Nov 2021 10:30:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PhodRkdh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PhodRkdh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzy1M6H1Jz2yQw
 for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Nov 2021 10:30:47 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3004A60F55;
 Wed, 24 Nov 2021 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637796643;
 bh=DxCqlQ+PoiA3QcJG5He3IJe+Kxv7xSxe+Xw210sQzLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PhodRkdh7DMAbGdeIweJgBiONkJCN7Qe6O39enhhUkX5HJZ4QQjmBZq0iyyejDWvA
 9HwuL7VAlhjWyRcgN9D3m4OE5keHOBASONtRpaDzVT5eOoEU3W/111ClA18j4vLzLl
 IkTtXKqcnkjLX3E191RxVxgsyCgsPIzIdVg6groO1ohyB/x/Wv55OfRKvT3hXaR96A
 penOf/4rmItfC3Doe06vOWX+ClBEn7w8qx/BaEKqZadRYjVsI50jJlPcUFhs2rgD2M
 iHuh7pJNaNnzsGB4GdHGUQ2x9EQXhn+7vdEvjwgfQxZtDQ37OfWvYrrlL2zny9ZNV3
 w1HyvEsYb6T9A==
Date: Wed, 24 Nov 2021 15:30:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH] net:phy: Fix "Link is Down" issue
Message-ID: <20211124153042.54d164dd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
References: <20211124061057.12555-1-dylan_hung@aspeedtech.com>
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 24 Nov 2021 14:10:57 +0800 Dylan Hung wrote:
> Subject: [PATCH] net:phy: Fix "Link is Down" issue

Since there will be v2, please also add a space between net: and phy:.
