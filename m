Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D19DAD0
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 02:48:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HVc34PgMzDqgw
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 10:48:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=lip6.fr
 (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr;
 envelope-from=julia.lawall@lip6.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lip6.fr
X-Greylist: delayed 67 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Aug 2019 10:48:28 AEST
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HVbw6VXkzDqdr
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 10:48:28 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.64,435,1559512800"; d="scan'208";a="398956385"
Received: from unknown (HELO hadrien) ([183.173.92.181])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 02:47:08 +0200
Date: Tue, 27 Aug 2019 08:47:04 +0800 (CST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH -next] mmc: aspeed: Fix return value check in
 aspeed_sdc_probe()
In-Reply-To: <629128e7-cc91-412f-8946-668fac2eb3b9@www.fastmail.com>
Message-ID: <alpine.DEB.2.21.1908270845410.2537@hadrien>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
 <20190826130343.GA23584@kadam>
 <629128e7-cc91-412f-8946-668fac2eb3b9@www.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Tue, 27 Aug 2019, Andrew Jeffery wrote:

>
>
> On Mon, 26 Aug 2019, at 22:34, Dan Carpenter wrote:
> > > Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
> >                         ^^^^
> > When we're adding new files, could we use the prefix for the new driver
> > instead of just the subsystem?  "mmc: aspeed: Add new driver"?
> > Otherwise it's tricky to know what people want for the driver.
>
> I don't have any issue with the request, but I don't understand this last
> bit. What do you mean by "it's tricky to know what people want for the
> driver"?

There is no obvious algorithm that tells how to go from a file name to an
appropriate subject line prefix.

julia
