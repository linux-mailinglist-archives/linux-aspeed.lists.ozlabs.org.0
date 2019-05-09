Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF0183A5
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 May 2019 04:17:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zxn44NL4zDqLp
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 May 2019 12:17:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zxmw5pgWzDqJq
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 May 2019 12:17:04 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x492Gja6014515;
 Wed, 8 May 2019 21:16:47 -0500
Message-ID: <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Eddie James
 <eajames@linux.ibm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 09 May 2019 12:16:45 +1000
In-Reply-To: <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
 <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
 <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
 <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
 <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
 <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-08 at 18:19 -0700, Jae Hyun Yoo wrote:
> I changed that from a bool because the maintainer of this code, Eddie
> doesn't like adding of an additional flag. I'll change it back with
> codes in the first submit:
> https://www.spinics.net/lists/linux-media/msg148955.html
> 
> Eddie,
> Please let me know if you have any objection on that.

Ok, so random flags ... ugh.

Well, you can approach it either way. Have them all be bitops or all be
bool.

The tricky thing however is that if they are bitops you need to ensure
that they are *all* manipulated under the same lock. If not you have to
use the atomic bitops variants.

The reason I don't like that is that experience shows that most uses of
such atomic variants in drivers usually are failed attempts at papering
over broken locking.

If everything is covered by a lock, then using the non-atomic versions
is more efficient, but so is using bool (optionally with :1 bitfield
qualifiers to avoid wasting memory), which from a pure C language
perspective I think is more expressive of what you are doing and more
readable.

Cheers,
Ben.

