Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F323252F7C1
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 May 2022 04:54:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4p965Hvbz3bly
	for <lists+linux-aspeed@lfdr.de>; Sat, 21 May 2022 12:54:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L4p904Kmgz2ywr
 for <linux-aspeed@lists.ozlabs.org>; Sat, 21 May 2022 12:54:43 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24L2pLgB004438;
 Fri, 20 May 2022 21:51:22 -0500
Message-ID: <5630dd68ca5f31dafce3f92489761294ea589b16.camel@kernel.crashing.org>
Subject: Re: [PATCH net v3] net: ftgmac100: Disable hardware checksum on
 AST2600
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Lunn <andrew@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Andrew
 Jeffery <andrew@aj.id.au>
Date: Sat, 21 May 2022 12:51:21 +1000
In-Reply-To: <20220517092217.323060-1-joel@jms.id.au>
References: <20220517092217.323060-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: netdev@vger.kernel.org, David Wilder <wilder@us.ibm.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2022-05-17 at 18:52 +0930, Joel Stanley wrote:
> The AST2600 when using the i210 NIC over NC-SI has been observed to
> produce incorrect checksum results with specific MTU values. This was
> first observed when sending data across a long distance set of
> networks.
> 
> On a local network, the following test was performed using a 1MB file
> of random data.

Can you double check with Aspeed what's going on there and whether
there's a way to instead, identify the bad case in the TX path and do
on-demand SW checksuming only in those cases ?

Because disabling HW checksum will kill performances afaik... (doesn't
it also end up disabling zero-copy and SG ?)

Cheers,
Ben.

> On the receiver run this script:
> 
>  #!/bin/bash
>  while [ 1 ]; do
>         # Zero the stats
>         nstat -r  > /dev/null
>         nc -l 9899 > test-file
>         # Check for checksum errors
>         TcpInCsumErrors=$(nstat | grep TcpInCsumErrors)
>         if [ -z "$TcpInCsumErrors" ]; then
>                 echo No TcpInCsumErrors
>         else
>                 echo TcpInCsumErrors = $TcpInCsumErrors
>         fi
>  done
> 
> On an AST2600 system:
> 
>  # nc <IP of  receiver host> 9899 < test-file
> 
> The test was repeated with various MTU values:
> 
>  # ip link set mtu 1410 dev eth0
> 
> The observed results:
> 
>  1500 - good
>  1434 - bad
>  1400 - good
>  1410 - bad
>  1420 - good
> 
> The test was repeated after disabling tx checksumming:
> 
>  # ethtool -K eth0 tx-checksumming off
> 
> And all MTU values tested resulted in transfers without error.
> 
> An issue with the driver cannot be ruled out, however there has been
> no
> bug discovered so far.
> 
> David has done the work to take the original bug report of slow data
> transfer between long distance connections and triaged it down to
> this
> test case.
> 
> The vendor suspects this this is a hardware issue when using NC-SI.
> The
> fixes line refers to the patch that introduced AST2600 support.
> 
> Reported-by: David Wilder <wilder@us.ibm.com>
> Reviewed-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3 modifies the wrapping of the commit message.
> 
> v2 updates the commit message with confirmation from the vendor that
> this is a hardware issue, and clarifies why the commit used in the
> fixes
> 
>  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index caf48023f8ea..5231818943c6 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1928,6 +1928,11 @@ static int ftgmac100_probe(struct
> platform_device *pdev)
>  	/* AST2400  doesn't have working HW checksum generation */
>  	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
>  		netdev->hw_features &= ~NETIF_F_HW_CSUM;
> +
> +	/* AST2600 tx checksum with NCSI is broken */
> +	if (priv->use_ncsi && of_device_is_compatible(np,
> "aspeed,ast2600-mac"))
> +		netdev->hw_features &= ~NETIF_F_HW_CSUM;
> +
>  	if (np && of_get_property(np, "no-hw-checksum", NULL))
>  		netdev->hw_features &= ~(NETIF_F_HW_CSUM |
> NETIF_F_RXCSUM);
>  	netdev->features |= netdev->hw_features;

