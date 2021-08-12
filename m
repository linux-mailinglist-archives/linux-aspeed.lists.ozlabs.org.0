Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DC3EA5C3
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Aug 2021 15:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlnmV0Dl9z30KN
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Aug 2021 23:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N+l05ozx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N+l05ozx; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnmJ3qJpz2yMG
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Aug 2021 23:37:02 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 c23-20020a0568301af7b029050cd611fb72so7744749otd.3
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Aug 2021 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lxEYcLoSmKcwAqq6lEWUTNh1J0BSQ5RJ+tPc70kIvv8=;
 b=N+l05ozxyD1NG1dkZUngFULf3v7jhRSbnR3bHLqfiz9dby07s+mONwlfvcPK0q4TpC
 7TiWQGQOBdoF1zE3c/2Gu2F+K4pOTl/yJy7prAkKAgeKH9paMe+57QeOsB1Sw8iBuDgf
 Bg7Lnbtyiqb+chBrZwjK1IQMznYfVvO7//56Eb19UoWrGfVEesfIKpwXICsLwFDGNkOT
 LBXWVs6EteP/0VimsFRXf7DXL7R4RVLFWiIewc/ERmTBNu76kb7rS5cQ+lxfBSfozlXq
 mhnZAoTGxU5l0sh9IM0Vh4vNMDkUmbcaFnAZsSxbEemP4+e0WlFJJyZTB9PmygkiPE6E
 BNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=lxEYcLoSmKcwAqq6lEWUTNh1J0BSQ5RJ+tPc70kIvv8=;
 b=gijKqSey3zyVNXulliiKaaT1IMaqu7s1/ed5ywL4M/VnkETaE8vtSg4m1KP+NDmo+b
 nqpGsYj8Ks2jlxyJ1QBfUeMH2YzUGDgMdfIyrQQhH1RysjM1fWOmDRfGAxQG+Izt8DYz
 bFWPNeDMVqtzFs3BtB/hfmRxR7p5t4oZNWQRqk0zW+CiyY0Z/esFuhhzMdVAAZLgQgj7
 kno/ehPc9NUaLeIwxPlNo6/lc+nqvWC41ufSmJEhFoKudTJtezQVZxpP8z9Udr9HAiYh
 fE+p4kLhws019TXxjPLg6VLCF7sSZea/jJN1jQodkLw2PbSojcSrIi7pvQpfHtGQNT1K
 74Vg==
X-Gm-Message-State: AOAM533N0Vn2QumwuXnSdtjvS3wbCO12X4GusdsKiPIwt538b61gfXs8
 Kbskrequ26Gjt5EfBVVbJ+vjzU0LZsOiMFY=
X-Google-Smtp-Source: ABdhPJwSEJIsmvBs2Ju7id/07iwZC6CGzdrHno0A3fxPpp0tLpTJfwR7oTj/F4lF6MngczX5vwnTPg==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr3478948ott.202.1628775418413; 
 Thu, 12 Aug 2021 06:36:58 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id r16sm605716otu.26.2021.08.12.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:36:57 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:39aa:3f67:e568:698d])
 by serve.minyard.net (Postfix) with ESMTPSA id 4F1F1180058;
 Thu, 12 Aug 2021 13:36:56 +0000 (UTC)
Date: Thu, 12 Aug 2021 08:36:55 -0500
From: Corey Minyard <minyard@acm.org>
To: Wolfram Sang <wsa@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [Openipmi-developer] [PATCH v5 1/3] i2c: aspeed: Add
 slave_enable() to toggle slave mode
Message-ID: <20210812133655.GT3406@minyard.net>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
 <20210714033833.11640-2-quan@os.amperecomputing.com>
 <YRTQP9sX0hkTJMTx@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRTQP9sX0hkTJMTx@shikoro>
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
Reply-To: minyard@acm.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 09:39:43AM +0200, Wolfram Sang wrote:
> Hi all,
> 
> On Wed, Jul 14, 2021 at 10:38:31AM +0700, Quan Nguyen wrote:
> > Slave needs time to prepare the response data before Master could
> > enquiry via read transaction. However, there is no mechanism for
> > i2c-aspeed Slave to notify Master that it needs more time to process
> > and this make Master side to time out when trying to get the response.
> > 
> > This commit introduces the slave_enable() callback in struct
> > i2c_algorithm for Slave to temporary stop the Slave mode while working
> > on the response and re-enable the Slave when response data ready.
> 
> Sorry that I couldn't chime in earlier, but NAK!
> 
> >  include/linux/i2c.h             |  2 ++
> 
> @Corey: Please do not change this file without my ACK. It is not a
> trivial change but an API extenstion and that should really be acked by
> the subsystem maintainer, in this case me. I was really surprised to see
> this in linux-next already.

I am sorry, I'll pull it out.

-corey

> 
> @all: Plus, I neither like the API (because it doesn't look generic to
> me but mostly handling one issue needed here) nor do I fully understand
> the use case. Normally, when a read is requested and the backend needs
> time to deliver the data, the hardware should stretch the SCL clock
> until some data register is finally written to. If it doesn't do it for
> whatever reason, this is a quirky hardware in my book and needs handling
> in the driver only. So, what is special with this HW? Can't we solve it
> differently?
> 
> All the best,
> 
>    Wolfram
> 




> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer

