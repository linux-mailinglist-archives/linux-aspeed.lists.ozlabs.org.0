Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B10651F3C
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Dec 2022 11:52:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbtgV4nRTz3bh4
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Dec 2022 21:52:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yhJTjcPy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yhJTjcPy;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbtgL3B1Fz2xJN
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Dec 2022 21:51:56 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id 17so11930012pll.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Dec 2022 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3J2t6zleCgSaKLgdwsyrOWk3vUr6ggb3hDwqkO8Hsk8=;
        b=yhJTjcPyEVStYIqzGKgu5LXSn6WS+0vwVkXG5oR+b5ML6XrciGesuHKBApFAUcmCJu
         txkw4JXcbHCIoLUnNMFU2YIdYzn5/KFH1sb8CCCqkUon43LmuU5k2pSPdezzgcJwlweU
         4W6Kw1T9xr4KiyydwA0f5BpuH/neWa8SYEi+ko/Ggm5qkaJSRYcilX/d4sSFHgDw/fkx
         wb5jwMoypxD2HdtVZQYt/2AjuOgKZ9HKoK6H2hUOcRD+kROH+DryZzmyHAGTsjTdw/0Y
         MMxiZvZoQzyT0tTZk/S6MBKHavCvMM2AAAny+UkoJ7hxBSx6Ju/x/tS9qerbsTGm6fz3
         NhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J2t6zleCgSaKLgdwsyrOWk3vUr6ggb3hDwqkO8Hsk8=;
        b=Z+Bpmg9d4zFeKRos8pOs9vGFC9i3JapwuRWh248AlGytuj5HVbGGl6Mrtmx/hj73EQ
         E5+sJakmes0DCAuOqnSQds2/KecOJQz9PyNIm6W99m/q1OXYmerbnJWnDDZbMKNHHzl8
         S7rhurMofcUQV09N48bCtJzmktGySlgYEGPsIsYV40TioEdvnQOj9Kg1HUpqmESVlgxa
         vnciWRvDxv7Ux8qM+lL0Y7Kxw5X+mIkuMSI4A73qkj7PG4fX8HSnjxATZQyedMo0WMHl
         7gJFBQ37OAdlZnNrN1Wa5nBJ5FyINpa0rk9ou+hJUgUEGQrCsu1AEB28H1Ew0TpDyCHt
         En3A==
X-Gm-Message-State: AFqh2kqfUyJKieZcjdGVB1l4tKYA906qrvmRaqMc8h9iGtsyNnCDqvSl
	9T9ON82cFaS6q4horF9WWRUPHSZ4QoSpwcbK7vMXVA==
X-Google-Smtp-Source: AMrXdXsbMmZ+abZvthKeUcE6S5KJ0Nw21C9lu75JjjhYsXq0C550qP+sb4SA09XW0kDvRbpGa0qljFkuavCHYUa5urw=
X-Received: by 2002:a17:903:25c5:b0:191:4149:2800 with SMTP id
 jc5-20020a17090325c500b0019141492800mr208plb.3.1671533514185; Tue, 20 Dec
 2022 02:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com>
In-Reply-To: <Y1uyssu84kl1INSR@kroah.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 20 Dec 2022 18:51:42 +0800
Message-ID: <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neal Liu <neal_liu@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 6:45 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 28, 2022 at 09:55:57AM +0000, Neal Liu wrote:
> > > > > > Thanks for your feedback.
> > > > > > I tried to reproduce it on my side, and it cannot be reproduce it.
> > > > > > Here are my test sequences:
> > > > > > 1. emulate one of the vhub port to usb ethernet through Linux
> > > > > > gadget
> > > > > > (ncm)
> > > > >
> > > > > We are using rndis instead of ncm.
> > > > >
> > > > > > 2. connect BMC vhub to Host
> > > > > > 3. BMC & Host can ping each other (both usb eth dev default mtu is
> > > > > > 1500) 4. Set BMC mtu to 1000 (Host OS cannot set usb eth dev mtu
> > > > > > to 2000, it's maxmtu is 1500)
> > > > >
> > > > > Not sure if it's related, but in my case (USB rndis, Debian 10 OS)
> > > > > it should be able to set MTU to 2000.
> > > >
> > > > Using rndis is able to set MTU to 2000, and the issue can be reproduced.

USB ecm is also tested and it is possible to set MTU to 2000, and
could reproduce the issue.
So I think this patch is needed anyway.

@Neal Liu Could you kindly help to verify the USB ECM case?

> > >
> > > Please NEVER use rndis anymore.  I need to go just delete that driver from
> > > the tree.
> > >
> > > It is insecure-by-design and will cause any system that runs it to be instantly
> > > compromised and it can not be fixed.  Never trust it.
> > >
> > > Even for data throughput tests, I wouldn't trust it as it does odd things with
> > > packet sizes as you show here.
> >
> > Thanks for the info, Greg.
> > If rndis will no longer be supported, how to use usb-ethernet on Windows OS?
> > For my understanding, ncm/ecm cannot work on Windows OS.
>
> rndis should ONLY be there for Windows XP, which is long out-of-support.
> Newer versions of windows have more sane usb protocols built into it and
> this driver is not needed.
>
> As proof of this, Android devices removed this from their kernel
> configuration a few years ago and no one has complained :)
>
> thanks,
>
> greg k-h
