Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE665610EEA
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Oct 2022 12:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzK274g4hz3cFc
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Oct 2022 21:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yj4rM9tk;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yj4rM9tk;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzK216pnXz3cBf
	for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Oct 2022 21:45:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FC2162793;
	Fri, 28 Oct 2022 10:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862DAC433D6;
	Fri, 28 Oct 2022 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666953909;
	bh=jKcdal1eAeH548wTNr8DKucNg4vasE8ekmVm8y7XImA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yj4rM9tk42hh+CVR/IUQmzjUBjxPas+HXIlaEYElR28cd9q8zhAlIGsAKUZPbAnWj
	 IiLLZMdbiBtghSWFCGIT1oFeRr1tG9nRmi/uEt5pxCgoXTXkQHBsN3AEXd5GtYW8WV
	 pB3iHBjQtZqj1JDNwL+yV00dTSsob0fez4TMySg8=
Date: Fri, 28 Oct 2022 12:45:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
Message-ID: <Y1uyssu84kl1INSR@kroah.com>
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com>
 <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 09:55:57AM +0000, Neal Liu wrote:
> > > > > Thanks for your feedback.
> > > > > I tried to reproduce it on my side, and it cannot be reproduce it.
> > > > > Here are my test sequences:
> > > > > 1. emulate one of the vhub port to usb ethernet through Linux
> > > > > gadget
> > > > > (ncm)
> > > >
> > > > We are using rndis instead of ncm.
> > > >
> > > > > 2. connect BMC vhub to Host
> > > > > 3. BMC & Host can ping each other (both usb eth dev default mtu is
> > > > > 1500) 4. Set BMC mtu to 1000 (Host OS cannot set usb eth dev mtu
> > > > > to 2000, it's maxmtu is 1500)
> > > >
> > > > Not sure if it's related, but in my case (USB rndis, Debian 10 OS)
> > > > it should be able to set MTU to 2000.
> > >
> > > Using rndis is able to set MTU to 2000, and the issue can be reproduced.
> > 
> > Please NEVER use rndis anymore.  I need to go just delete that driver from
> > the tree.
> > 
> > It is insecure-by-design and will cause any system that runs it to be instantly
> > compromised and it can not be fixed.  Never trust it.
> > 
> > Even for data throughput tests, I wouldn't trust it as it does odd things with
> > packet sizes as you show here.
> 
> Thanks for the info, Greg.
> If rndis will no longer be supported, how to use usb-ethernet on Windows OS?
> For my understanding, ncm/ecm cannot work on Windows OS.

rndis should ONLY be there for Windows XP, which is long out-of-support.
Newer versions of windows have more sane usb protocols built into it and
this driver is not needed.

As proof of this, Android devices removed this from their kernel
configuration a few years ago and no one has complained :)

thanks,

greg k-h
