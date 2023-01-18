Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BFE670FD1
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 02:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxSYZ21M5z3c8f
	for <lists+linux-aspeed@lfdr.de>; Wed, 18 Jan 2023 12:17:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QbeEAIQw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QbeEAIQw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxSYP4NJqz3bhx
	for <linux-aspeed@lists.ozlabs.org>; Wed, 18 Jan 2023 12:17:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91B03615BF;
	Wed, 18 Jan 2023 01:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDEC433D2;
	Wed, 18 Jan 2023 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674004662;
	bh=FGOiyRzcJoEHKdMm+kbK+YBbd8BVEKp07glKSiqMg5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QbeEAIQw7uP/CRIUHrwWm1uUqA0LznQ6bZkZCm/JvVzO+chR72Aco1aIqOwMEMO6A
	 nBojp92S1Dz6EWGVhbEqXnr2gR1nDDCg1BvKgFHpWbYSepjNRH/Y/8jrAVBM+iwkX5
	 HJdlwLQF+HWFHnVGGr0vEm2GmGJw5zhl0oOL6KxGZo1YkpRav1MK6etkZ44IQEhchi
	 ys/UxjqQtx//40gat0FDCYAyyq+pPU/BaAhpVXg2/scFUUHc+hUK6WNuwBEXmm5NCW
	 cvWuhnpp8XPzu/obuWLLL3faKEfzlFEgRT48oZuIESimcnHSBlKaDsX86cFMQE22Of
	 l8V+vvA4V+WDQ==
Date: Tue, 17 Jan 2023 17:17:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH net-next 2/6] net: mdio: Rework scanning of bus ready
 for quirks
Message-ID: <20230117171740.3a9e6f8d@kernel.org>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
References: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
	<20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 16 Jan 2023 13:55:14 +0100 Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Some C22 PHYs do bad things when there are C45 transactions on the
> bus. In order to handle this, the bus needs to be scanned first for
> C22 at all addresses, and then C45 scanned for all addresses.
> 
> The Marvell pxa168 driver scans a specific address on the bus to find
> its PHY. This is a C22 only device, so update it to use the c22
> helper.

clang says:

drivers/net/phy/mdio_bus.c:708:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
        while (--i >= 0) {
                 ^
drivers/net/phy/mdio_bus.c:620:7: note: initialize the variable 'i' to silence this warning
        int i, err;
             ^
              = 0
