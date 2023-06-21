Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F5738A52
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Jun 2023 18:00:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ef8MjNep;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmSrT10mBz3bVv
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Jun 2023 02:00:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ef8MjNep;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmSrL52MDz3bTk
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Jun 2023 02:00:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92C8B615A2;
	Wed, 21 Jun 2023 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776A8C433C0;
	Wed, 21 Jun 2023 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687363198;
	bh=mHRta9tIJV2JDA/5J295h4GbkMjyOk5qKzU56OUj/sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ef8MjNepoOxKJfpbzY04NICf1OgzrJvYyTtjCFUEJSUHj/8qey/p4CbAUNyZveqZT
	 bm0jdMdQZE5OhNXnmpkUqw2ePKIN0f94/wJs/74eGqz+r8aY1S6ybaRKn99jshcW92
	 W1RJzagbkPcofo+4RCi0w14pEGsgJ2JKLubbpXd0=
Date: Wed, 21 Jun 2023 17:59:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
Message-ID: <2023062146-stony-lair-b6a3@gregkh>
References: <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com>
 <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com>
 <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
 <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
 <CAGm54UG2uD2jruRc33Xm4izepYpuFNBBcGe594as8_fx1uEWQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGm54UG2uD2jruRc33Xm4izepYpuFNBBcGe594as8_fx1uEWQg@mail.gmail.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Neal Liu <neal_liu@aspeedtech.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 08:02:14PM +0800, Lei Yu wrote:
> On Wed, Dec 21, 2022 at 10:26 AM Lei Yu <yulei.sh@bytedance.com> wrote:
> >
> > On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
> > > > > > > > Using rndis is able to set MTU to 2000, and the issue can be
> > > > reproduced.
> > > >
> > > > USB ecm is also tested and it is possible to set MTU to 2000, and could
> > > > reproduce the issue.
> > > > So I think this patch is needed anyway.
> > > >
> > > > @Neal Liu Could you kindly help to verify the USB ECM case?
> > >
> > > How to set MTU to 2000 on USB ECM case? I remember last time I cannot set by using "ifconfig ..."
> > > Regardless ECM or RNDIS, I agree this patch is still needed.
> >
> > You were able to set MTU to 2000 for RNDIS but not for NCM.
> > @Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
> > So I tested ECM and verified it could set MTU 2000 and the issue could
> > be reproduced.
> 
> This patch fixes the kernel oops in the aspeed-vhub driver for both
> USB ECM and RNDIS.
> It now has an Acked-by from benh and Reviewed-by from neal_liu
> 
> Should we merge this patch?

Can you please resend it?

thanks,

greg k-h
