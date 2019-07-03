Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F35ECC2
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Jul 2019 21:26:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fB1J4BDzzDqXQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jul 2019 05:26:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=perches.com
 (client-ip=216.40.44.41; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 610 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jul 2019 05:26:22 AEST
Received: from smtprelay.hostedemail.com (smtprelay0041.hostedemail.com
 [216.40.44.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fB1C02XQzDqQG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Jul 2019 05:26:21 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 3927F18353A48
 for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Jul 2019 19:16:13 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 9890718021864;
 Wed,  3 Jul 2019 19:16:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2194:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3867:4250:4321:5007:6642:6742:7903:7904:10004:10400:10848:11026:11232:11473:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21451:21627:30054:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:23,
 LUA_SUMMARY:none
X-HE-Tag: farm73_34d274a800e47
X-Filterd-Recvd-Size: 1862
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed,  3 Jul 2019 19:16:02 +0000 (UTC)
Message-ID: <2f19693f2f720dcc037465d4ae517fb846c7eb4f.camel@perches.com>
Subject: Re: [patch v3 1/5] AST2500 DMA UART driver
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, "sudheer.v" <open.sudheer@gmail.com>
Date: Wed, 03 Jul 2019 12:16:01 -0700
In-Reply-To: <20190703174926.GA12813@kroah.com>
References: <1561459476-14268-1-git-send-email-open.sudheer@gmail.com>
 <1561459476-14268-2-git-send-email-open.sudheer@gmail.com>
 <20190703174926.GA12813@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 sudheer.veliseti@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 shivahshankar@gmail.com, linux-kernel@vger.kernel.org,
 shivahshankar.shankarnarayanrao@aspeedtech.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, jslaby@suse.com,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-03 at 19:49 +0200, Greg KH wrote:
> On Tue, Jun 25, 2019 at 04:14:32PM +0530, sudheer.v wrote:
> > +#define UART_TX_R_POINT(x) (0x40 + (x * 0x20))
> > +#define UART_TX_W_POINT(x) (0x44 + (x * 0x20))
> > +#define UART_TX_SDMA_ADDR(x) (0x48 + (x * 0x20))
> > +#define UART_RX_R_POINT(x) (0x50 + (x * 0x20))
> > +#define UART_RX_W_POINT(x) (0x54 + (x * 0x20))
> > +#define UART_RX_SDMA_ADDR(x) (0x58 + (x * 0x20))
> 
> Please use a tab to line these up.

Also x should be surrounded by parentheses

#define UART_TX_R_POINT(x)	(0x40 + ((x) * 0x20))

etc...


