Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7136BCD9
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Apr 2021 03:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTk8d3XbQz301g
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Apr 2021 11:05:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=gmail.com (client-ip=54.86.164.124; helo=mail.javad.com;
 envelope-from=sorganov@gmail.com; receiver=<UNKNOWN>)
X-Greylist: delayed 447 seconds by postgrey-1.36 at boromir;
 Sat, 24 Apr 2021 00:47:54 AEST
Received: from mail.javad.com (mail.javad.com [54.86.164.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcbG6HHhz2xdP
 for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Apr 2021 00:47:52 +1000 (AEST)
Received: from osv (unknown [89.175.180.246])
 by mail.javad.com (Postfix) with ESMTPSA id 905303E95C;
 Fri, 23 Apr 2021 14:40:20 +0000 (UTC)
Received: from osv by osv with local (Exim 4.92)
 (envelope-from <sorganov@gmail.com>)
 id 1lZwyh-0004QE-7K; Fri, 23 Apr 2021 17:40:19 +0300
From: Sergey Organov <sorganov@gmail.com>
To: Walter Harms <wharms@bfs.de>
Subject: Re: AW: [PATCH] soc: aspeed: fix a ternary sign expansion bug
References: <YIE90PSXsMTa2Y8n@mwanda>
 <59596244622c4a15ac8cc0747332d0be@AcuMS.aculab.com>
 <877dktuvmz.fsf@osv.gnss.ru>
 <265e2d3accc74c89b5bab22eadb43808@AcuMS.aculab.com>
 <ebe4a1a6dd0748e28e6ca19aec20223e@bfs.de>
Date: Fri, 23 Apr 2021 17:40:19 +0300
In-Reply-To: <ebe4a1a6dd0748e28e6ca19aec20223e@bfs.de> (Walter Harms's message
 of "Fri, 23 Apr 2021 11:03:30 +0000")
Message-ID: <878s59rrn0.fsf@osv.gnss.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:05:09 +1000
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
Cc: Robert Lippert <rlippert@google.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 David Laight <David.Laight@ACULAB.COM>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 'Dan Carpenter' <dan.carpenter@oracle.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Walter Harms <wharms@bfs.de> writes:

> as indepentent observer,
> i would go for Dans solution:
>
> ret = kfifo_to_user();
> /* if an error occurs just return */
> if (ret)
>    return ret;
>
> /* otherwise return the copied number of bytes */
>
> return copied;
>
> there is no need for any deeper language knowledge,

Yep, but this is not idiomatic C, so one looking at this code would
tend to convert it back to ternary, and the actual problem here is that
the type of 'copied' does not match the return type of the function.

-- Sergey Organov
