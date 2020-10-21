Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC92945C5
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 02:00:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG9cl4Xl7zDqdk
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 11:00:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG9cM1VH7zDqNH
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 11:00:32 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09L008ZS007548
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Oct 2020 19:00:12 -0500
Message-ID: <86480db3977cfbf6750209c34a28c8f042be55fb.camel@kernel.crashing.org>
Subject: Re: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, "David
 S . Miller" <davem@davemloft.net>, Dylan Hung <dylan_hung@aspeedtech.com>
Date: Wed, 21 Oct 2020 11:00:08 +1100
In-Reply-To: <20201020220639.130696-1-joel@jms.id.au>
References: <20201020220639.130696-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2020-10-21 at 08:36 +1030, Joel Stanley wrote:
> We must ensure the tx descriptor updates are visible before updating
> the tx pointer.
> 
> This resolves the tx hangs observed on the 2600 when running iperf:

To clarify the comment here. This doesn't ensure they are visible to
the hardware but to other CPUs. This is the ordering vs start_xmit and
tx_complete.

Cheers,
Ben.

> root@ast2600:~# iperf3 -c 192.168.86.146 -R
> Connecting to host 192.168.86.146, port 5201
> Reverse mode, remote host 192.168.86.146 is sending
> [  5] local 192.168.86.173 port 43886 connected to 192.168.86.146
> port 5201
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-1.00   sec  90.7 MBytes   760 Mbits/sec
> [  5]   1.00-2.00   sec  91.7 MBytes   769 Mbits/sec
> [  5]   2.00-3.00   sec  91.7 MBytes   770 Mbits/sec
> [  5]   3.00-4.00   sec  91.7 MBytes   769 Mbits/sec
> [  5]   4.00-5.00   sec  91.8 MBytes   771 Mbits/sec
> [  5]   5.00-6.00   sec  91.8 MBytes   771 Mbits/sec
> [  5]   6.00-7.00   sec  91.9 MBytes   771 Mbits/sec
> [  5]   7.00-8.00   sec  91.4 MBytes   767 Mbits/sec
> [  5]   8.00-9.00   sec  91.3 MBytes   766 Mbits/sec
> [  5]   9.00-10.00  sec  91.9 MBytes   771 Mbits/sec
> [  5]  10.00-11.00  sec  91.8 MBytes   770 Mbits/sec
> [  5]  11.00-12.00  sec  91.8 MBytes   770 Mbits/sec
> [  5]  12.00-13.00  sec  90.6 MBytes   761 Mbits/sec
> [  5]  13.00-14.00  sec  45.2 KBytes   370 Kbits/sec
> [  5]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec
> [  5]  15.00-16.00  sec  0.00 Bytes  0.00 bits/sec
> [  5]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec
> [  5]  17.00-18.00  sec  0.00 Bytes  0.00 bits/sec
> [   67.031671] ------------[ cut here ]------------
> [   67.036870] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:442
> dev_watchdog+0x2dc/0x300
> [   67.046123] NETDEV WATCHDOG: eth2 (ftgmac100): transmit queue 0
> timed out
> 
> Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index 331d4bdd4a67..15cdfeb135b0 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct
> ftgmac100 *priv)
>  	ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
>  	txdes->txdes0 = cpu_to_le32(ctl_stat & priv-
> >txdes0_edotr_mask);
>  
> +	/* Ensure the descriptor config is visible before setting the
> tx
> +	 * pointer.
> +	 */
> +	smp_wmb();
> +
>  	priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv,
> pointer);
>  
>  	return true;
> @@ -806,6 +811,11 @@ static netdev_tx_t
> ftgmac100_hard_start_xmit(struct sk_buff *skb,
>  	dma_wmb();
>  	first->txdes0 = cpu_to_le32(f_ctl_stat);
>  
> +	/* Ensure the descriptor config is visible before setting the
> tx
> +	 * pointer.
> +	 */
> +	smp_wmb();
> +
>  	/* Update next TX pointer */
>  	priv->tx_pointer = pointer;
>  

