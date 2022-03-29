Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A24EA6AF
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 06:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSH7M4nZbz2xYB
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 15:45:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JVgTwdJM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JVgTwdJM; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSH7C6gYHz2xBf
 for <linux-aspeed@lists.ozlabs.org>; Tue, 29 Mar 2022 15:45:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8958C6144A;
 Tue, 29 Mar 2022 04:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49671C340ED;
 Tue, 29 Mar 2022 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648529124;
 bh=6hJOtf0eN1JPWyNYTlK4OfqUxK64irFgfVb+4qtqv2I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JVgTwdJM7LTPHhgBoMYT/ZUmYbTqUSmbbz/jg3r+HoEsNAK6HqHxef2uUISQTSDe2
 Hb9jTxx95gh6wquGFQF9jB7VJDKlehXpa30qchSkwlpgu4VQ0HhVke/2vcWpuBxTLQ
 qiBlZbT5tfEVhsBNPv7ifQYMnYY0VQEqd0eo2V6VFNqWYJSAH0nzZfS7Ow+KFTnYbR
 boAbdxkJC33OkKyBJVd8ggPpJpDA7JH7mBgJ3HaDCg0V5UVrvoAB3eOmqxyAN9+3Ef
 SBWtZ7jBy7dozNrQUjmewvHcvGV3NHaS9kEH2ROrZU5Dyge/BLQU8EclOm7o/c0LY9
 kIM8UjAJP6viA==
Date: Mon, 28 Mar 2022 21:45:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v3 0/3] Add reset deassertion for Aspeed MDIO
Message-ID: <20220328214522.7cfdff1e@kernel.org>
In-Reply-To: <20220325041451.894-1-dylan_hung@aspeedtech.com>
References: <20220325041451.894-1-dylan_hung@aspeedtech.com>
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
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 25 Mar 2022 12:14:48 +0800 Dylan Hung wrote:
> Add missing reset deassertion for Aspeed MDIO bus controller. The reset
> is asserted by the hardware when power-on so the driver only needs to
> deassert it. To be able to work with the old DT blobs, the reset is
> optional since it may be deasserted by the bootloader or the previous
> kernel.

# Form letter - net-next is closed

We have already sent the networking pull request for 5.18
and therefore net-next is closed for new drivers, features,
code refactoring and optimizations. We are currently accepting
bug fixes only.

Please repost when net-next reopens after 5.18-rc1 is cut, in ~1 week.

RFC patches sent for review only are obviously welcome at any time.
