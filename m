Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233BD4C7E
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 05:38:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qrC4353yzDqd2
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 14:38:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qrBv27qTzDqbW
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 14:38:24 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D377B14FD3304;
 Fri, 11 Oct 2019 20:38:12 -0700 (PDT)
Date: Fri, 11 Oct 2019 20:38:12 -0700 (PDT)
Message-Id: <20191011.203812.1828730130029996774.davem@davemloft.net>
To: andrew@aj.id.au
Subject: Re: [PATCH v2 0/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191010020756.4198-1-andrew@aj.id.au>
References: <20191010020756.4198-1-andrew@aj.id.au>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 11 Oct 2019 20:38:13 -0700 (PDT)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 10 Oct 2019 12:37:53 +1030

> This series slightly extends the devicetree binding and driver for the
> FTGMAC100 to describe an optional RMII RCLK gate in the clocks property.
> Currently it's necessary for the kernel to ungate RCLK on the AST2600 in NCSI
> configurations as u-boot does not yet support NCSI (which uses the
> R(educed)MII).
> 
> v2:
> * Clear up Reduced vs Reversed MII in the cover letter
> * Mitigate anxiety in the commit message for 1/3 
> * Clarify that AST2500 is also affected in the clocks property description in
>   2/3
> * Rework the error paths and update some comments in 3/3
> 
> v1 can be found here: https://lore.kernel.org/netdev/20191008115143.14149-1-andrew@aj.id.au/

Series applied to net-next, thank you.
