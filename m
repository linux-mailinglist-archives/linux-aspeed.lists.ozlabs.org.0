Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48A7AA801
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 06:55:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VRFc4QkU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsKhy0TCvz2yDt
	for <lists+linux-aspeed@lfdr.de>; Fri, 22 Sep 2023 14:55:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VRFc4QkU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrzG71Wx2z3c12
	for <linux-aspeed@lists.ozlabs.org>; Fri, 22 Sep 2023 01:04:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD436182E;
	Thu, 21 Sep 2023 15:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3B8C4E75C;
	Thu, 21 Sep 2023 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695308682;
	bh=CRXh/3WmFeRF4emfkW9qLsHyIVF5cqNuXHQEj19Hprc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRFc4QkUGkD5iaifmciPjC/qPhzL5Fda2wpSBbplnNUw+9muYkK/UCS5rY3W09X3k
	 6Mhex3e99h178rgcD/c8lIHpx6f8UDvMOqwJ7s4qquxa0BkosppA196DBsKji6pW8U
	 ICHaf2YEiFfGDAQAPXuB/gUxu58lcIdUSbDfg8mlgOtXwewzEzysNjts856dkIWjuX
	 lKKzN4zav/7lETaDYOBLRM7x1RKlEWKeO4boz4lUe2uA8QhrR8wgTqwZa1JP8mqyul
	 B++L9eT+pTewygRfIxHuGqxwdYpE5WXGKlC4iWnAHVNA3lxMmoXy+K+hJmlVgo6Sw9
	 tRmj8qYiOKfBw==
Date: Thu, 21 Sep 2023 16:04:32 +0100
From: Simon Horman <horms@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH net-next 00/19] net: mdio: Convert to platform remove
 callback returning void
Message-ID: <20230921150432.GP224399@kernel.org>
References: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:53:47 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Jerome Brunet <jbrunet@baylibre.com>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org, linux-
 kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 09:50:43PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this series convert all platform drivers below drivers/net/mdio to
> use remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply, please apply the remainder of this series anyhow.
> 
> Best regards
> Uwe

For series,

Reviewed-by: Simon Horman <horms@kernel.org>

