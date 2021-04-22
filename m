Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C72368948
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 01:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRCwH2xZQz3002
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 09:16:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2607:5300:60:148a::1;
 helo=zeniv-ca.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [IPv6:2607:5300:60:148a::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQsgS6Yx9z2xZQ
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Apr 2021 19:33:56 +1000 (AEST)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lZVZz-007H7H-RC; Thu, 22 Apr 2021 09:24:59 +0000
Date: Thu, 22 Apr 2021 09:24:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Message-ID: <YIFA68mfUTSMczp0@zeniv-ca.linux.org.uk>
References: <YIE90PSXsMTa2Y8n@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIE90PSXsMTa2Y8n@mwanda>
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:16:12 +1000
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
Cc: Robert Lippert <rlippert@google.com>, linux-aspeed@lists.ozlabs.org,
 Patrick Venture <venture@google.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 12:11:44PM +0300, Dan Carpenter wrote:
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
> 
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
> 
> Fix this by removing the ternary so that "ret" is type promoted directly
> to long.

Hmm...  Let's grep for kfifo_to_user() - smells like a possible recurring bug...
Yup -

samples/kfifo/bytestream-example.c:138: ret = kfifo_to_user(&test, buf, count, &copied);
samples/kfifo/inttype-example.c:131:    ret = kfifo_to_user(&test, buf, count, &copied);
samples/kfifo/record-example.c:145:     ret = kfifo_to_user(&test, buf, count, &copied);

All three are exactly like that one.
