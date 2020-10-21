Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F52947EA
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 07:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGKD64SFSzDqQH
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 16:43:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=qkG/q41a; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ICBjoYSi; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGKCw5pzGzDqDc
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 16:43:23 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EDD745C0100;
 Wed, 21 Oct 2020 01:43:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 21 Oct 2020 01:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=tIgDNnG5snpYSQp0kAt2AdCdiGSp2Gs
 1VIoKFmFsA5M=; b=qkG/q41a7iniJkupVewamRCA0NtPXMrcdZp9KfF4ht5qLoq
 s3t9ZrpD3kEWd4bkoe6Q9uBGfMRrsKzSq3+ejGpd9eTNnRcNWFaY+IGhACL9lvWD
 KfNiW9MPeLhmNx43+55CZ3co4UA8hrC7kOvpmWSunBuSUQJZPUGoaJuiG07DwLgN
 7e4Q+NaqhlcvNC0ZqkG+2PIgO4xAgXgW3JFerpm4ndxEGUiLpAQyvptrz66EKNl5
 9YsALU8Yh6zY3mJHe8WFw4p9wGADoOEhxs+3iXRBlDcArz9SNJc5N61uvprBnj/7
 bpiGNwqMk5J4/mJ0xhK1G5dYwtlbxd43WypQ9Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tIgDNn
 G5snpYSQp0kAt2AdCdiGSp2Gs1VIoKFmFsA5M=; b=ICBjoYSiqT3BZxu4o4XSSW
 ZF0Iagj1x4vRzInlR3N77HPKlqIvG6wnlnjNgDr+E/VE//hMzdl+hZkV0UBHhnMM
 LbE5FanF5PEcuScEHWW/+M7i6pW4qXXkki2l3tLZTDD6Ql7AamEFHgTIepMBJw8u
 GgJmO1Ns2ucOuJOTk3fM0dN9nOc42vX+qUQcaLn9Ff4S1ZXxyvnO4WWUDuIxeMqv
 pVg1d9EMbeDPQtclWk7rvBSJkLAnkYCZVoU+FboYqi8fcM9159e+RzVamQUDgTsW
 4g34XM6ehpAyj5pgklHk8RQA9dvBn+xP/OalJgLqLIwoXTMqhRZ5eAa7K0iOhVhg
 ==
X-ME-Sender: <xms:dsqPXywn4L4MW3q8FD0bMLhosqeB4LvMYsIEq81R_fEjqxSNzfV-RQ>
 <xme:dsqPX-RRKDU5puLhKT3MBYJhZCuVF1XwU4xlPmLT621wdP76ZyVv_Od9E0WLDMH-9
 v5-4kdcDn7Oz6imnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeggdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:dsqPX0UOTgnBSYFJeIlK7b1sAmgflf-DRuXoW-3GD-NtKb9Kvqdf4A>
 <xmx:dsqPX4h9jVneVErTX32YRPtna0ZUs-hNPXWRT0c3qtrBw4ZOWwOe0A>
 <xmx:dsqPX0BnqiWWXRtXm-xBv2oI0_P5hDuTN06Dnv5UBGNa2FNyVsTjVg>
 <xmx:d8qPX3N4ha_KwCmDiDDmeI1m9lVPwY1PqCksn-vUHupVAvAc8PNXvw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A58C9E011E; Wed, 21 Oct 2020 01:43:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-502-gfef6c88-fm-20201019.001-gfef6c888
Mime-Version: 1.0
Message-Id: <1a5c7370-164c-4a58-a08c-d81e4b6ce419@www.fastmail.com>
In-Reply-To: <CACPK8XeiPBPyLu5pvjCgYquCKh+PynVKGyibUSAi+W_xw0Awfg@mail.gmail.com>
References: <20201016043513.119841-1-andrew@aj.id.au>
 <20201016043513.119841-3-andrew@aj.id.au>
 <CACPK8XeiPBPyLu5pvjCgYquCKh+PynVKGyibUSAi+W_xw0Awfg@mail.gmail.com>
Date: Wed, 21 Oct 2020 16:12:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 2/2] ARM: dts: tacoma: Add reserved memory for ramoops
Content-Type: text/plain
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Wed, 21 Oct 2020, at 15:35, Joel Stanley wrote:
> On Fri, 16 Oct 2020 at 04:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Reserve a 1.5MiB region of memory to record kmsg dumps, console and
> > userspace message state into 16kiB ring-buffer slots. The sizing allows
> > for up to 32 dumps to be captured and read out.
> >
> > Set max-reason to KMSG_DUMP_EMERG to capture bad-path reboots.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > index 46f2f538baba..4f7e9b490e1a 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > @@ -26,6 +26,15 @@ reserved-memory {
> >                 #size-cells = <1>;
> >                 ranges;
> >
> > +               ramoops@b9e80000 {
> > +                       compatible = "ramoops";
> > +                       reg = <0xb9e80000 0x180000>;
> 
> I take that r-b back. When booting, we see:
> 
> [    0.000000] region@ba000000 (0xb8000000--0xbc000000) overlaps with
> ramoops@b9e80000 (0xb9e80000--0xba000000)
> 
> Which appears to be a true statement.

Yep:

> 
> > +                       record-size = <0x4000>;
> > +                       console-size = <0x4000>;
> > +                       pmsg-size = <0x4000>;
> > +                       max-reason = <3>; /* KMSG_DUMP_EMERG */
> > +               };
> > +
> >                 flash_memory: region@ba000000 {
> >                         no-map;
> >                         reg = <0xb8000000 0x4000000>; /* 64M */

Looks like I derived the ramoops address from the flash_memory node label, but 
that's mismatched with its reg value.
