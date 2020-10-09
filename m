Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C92881CB
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 07:47:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6xsl4rY8zDqWY
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 16:47:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=FJ/tXpD0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lPzBjITb; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6xsZ0RDhzDqVV
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 16:46:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B08505C00FB;
 Fri,  9 Oct 2020 01:46:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Oct 2020 01:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=lr6M8yNWNeNhl0M7Uihv92Zrbfw
 BaHLmXICbGyQw3sw=; b=FJ/tXpD0Y7sB0j+cc5vQf+iH2TZGeRZXYgUxYBpWp22
 M/rU3q47XK6L2i3skTzn5H7TMHBYmyJ1hCLO6s6/vcaHctVvV5hm+R1CkKVVCj//
 F++o4MQaaNY4+okaADmWuiXixSf4Aw7+cRIS6k1dNrfLUfm0SApp2MnBlxf5T1P3
 bOOtfIct1mPO8ejAgeFGC+fW2H7LF9eNUZHWg6iLKXVStiHlzP3DpNjHtPopYa+X
 KBbqQUpV31r8QtGbkz2345GOsUWTZ0dJiGGxiZU+sWxLXfru2xV+lWDDuTdhyANW
 j7wGnIFAcWIgVrHpPwRMOgNpyMC+LIzwoGyF0nY6Gbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lr6M8y
 NWNeNhl0M7Uihv92ZrbfwBaHLmXICbGyQw3sw=; b=lPzBjITbjluDqdA+x3a6p1
 fXUE5PHtDHEybWDeXsIEc4LTD1nRvMtrs2qxOJUuU39ay5Kgp+e2XzjmpPBaHPRr
 6xozogYcCQr/UQQa6BpPAYlTIaas6JfwDGZM4ZNStAbfoGnlhb+OHjwMDeWZYWhS
 dDdUqu3ZcH7s6Vvrq3n5Eo5z+Xl9dc2nP4kTsCcL0E6en/iLdB9r8Gv2sBZ/jfkF
 8JVvV6BiTZsbeTYI+JdZJQHVHmU1qUQeKF+SNaldHros5EM7AFlp3fmjY5bQKNXF
 6AqMN0Ss43l7BwnEJik6pPv81lZd1kwxmKoYlXVZciY/6CGVODi7YPOAyfGzvDLw
 ==
X-ME-Sender: <xms:TPl_X2caWGvi3VRHyI18GPeLki0nojvAaIU-ndh3AXLSK9zvGq9BJQ>
 <xme:TPl_XwPkJc1LRi_rhqmd6ukmT3iAL9lgMy4n658LaDgNBJNlAK_ov4r6KazaGmkjG
 ROqBmseWdyZag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedtgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:TPl_X3gfISg1OAJpOr8-k4XRDHyWWHQNI9BNAKlxOrq21OfubtLnlQ>
 <xmx:TPl_Xz-i4y-sQAFs1-zWDjqhc09qGEN_-cfQbvyNw2cJFVprgpDT0w>
 <xmx:TPl_XytzCFjgas5xRQ1mrLR4mFqrzY6eyElzJ_hw7pnuc0slMwYzRw>
 <xmx:Tfl_X2jnrDMdOayiTncG2in50xxMJQ8nGzSZj7EWovAGH1zPfpc60A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2AD563064610;
 Fri,  9 Oct 2020 01:46:52 -0400 (EDT)
Date: Fri, 9 Oct 2020 07:46:50 +0200
From: Greg KH <greg@kroah.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/3] configs: aspeed: enable UHCI driver in defconfig
Message-ID: <20201009054650.GA117723@kroah.com>
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-2-ryan_chen@aspeedtech.com>
 <20201009044526.GB111063@kroah.com>
 <CACPK8Xd0h_2yGeyOjrpqV2_X8f4stZA_ur72b4Y4Nx91GrbXag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xd0h_2yGeyOjrpqV2_X8f4stZA_ur72b4Y4Nx91GrbXag@mail.gmail.com>
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
Cc: BMC-SW <bmc-sw@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 09, 2020 at 04:55:19AM +0000, Joel Stanley wrote:
> On Fri, 9 Oct 2020 at 04:45, Greg KH <greg@kroah.com> wrote:
> >
> > On Fri, Oct 09, 2020 at 10:49:35AM +0800, Ryan Chen wrote:
> > > v2:
> > >  -Changed : Add SCSI, BLK_DEV_SD, USB_STORAGE support.
> > > v1:
> > >  -Enable UHCI driver in aspeed_g5_defconfig.
> > >
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> >
> > Why do you need this in a defconfig?
> 
> I would prefer configurations that are being used to be present in the
> defconfig so we can test it. I think this is a sensible change.

Then it needs to be described in the changelog, otherwise we have no
idea why this is happening :)

thanks,

greg k-h
