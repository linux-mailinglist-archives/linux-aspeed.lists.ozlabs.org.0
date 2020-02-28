Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0F173281
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Feb 2020 09:14:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TMlP2zQLzDqvg
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Feb 2020 19:14:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BclSCGD/; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TMjt5DllzDrJp;
 Fri, 28 Feb 2020 19:13:22 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i6so1340923pfc.1;
 Fri, 28 Feb 2020 00:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1XeAZdDEEMWPSRFSSrigFDHZjIaWywrJrDOcCv/SctI=;
 b=BclSCGD/+Gp7pLCK+Yfq+IH0orWklytTcUNiFna90KwERemW3y0lq2SFGwBTScn/ZR
 SOnMFpFra//MK4i1yP2XSWxhSB0AmtyVADIvnaixDjHOEilFGfAtxn96llpXGSu9w6x9
 cnYc7x7sgEcbB4wEdoWPyc1hRhVj/x1T1b7yJp/3L1qebJXpWiZZcerMA4aKUSTSJzOu
 +EJL716Ez9KnsOA3AUIXTOEjEYftKhDFAE4pxRa3OfvNhxlaMqYrOmYwyXYyNJdP0BwU
 JH+Jb4ugNll/M3AjCQdCwSJWKoNoHs8e/biyVduULpYiHq+u7xkE0FG316miHyBgMLPu
 3vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1XeAZdDEEMWPSRFSSrigFDHZjIaWywrJrDOcCv/SctI=;
 b=UUK7E4FXzk2ce895l1oMUDZBGvgv6KWS5Zd2b28+vXt96jHuO6meDKr4z83X64N/GF
 FdtlU3v9NZPXtfIuWYEASHBZ7XgVP+yhJzEuFV2rsziJHw9DOIoLl7dbDgUPLdAfkAsz
 WToJlIIakBT6nRi1PyINIZ436fhMJpUzt2p6E+0GV1sV4UqhDzYKXYFfAG/yrhxxPQ01
 VN7A2anySvrw1FHV4D1uwa6KKqVNEPNHnDthyXYWj7gy/jGmfQ9j0oK2eO3upUlHZp1h
 BZ7Z1cFZbHalSN3BV+UtxhYCtk9jH1+wNlcO1KBJ39IQYbCPm68Goah1vD8u6suCxkoD
 p9Qg==
X-Gm-Message-State: APjAAAXM1RDHQ1eJQqttQxrJXihwG78ZVyHADLMv7Dm6EPN2sCxYmN6R
 YadlvZBp2HZCip376Zz7/xA=
X-Google-Smtp-Source: APXvYqwaScFWt2pSZw8deGePN2rW5lckHptMxbrEKDdWitX5+l+202jKgzn654xFzxvUIwznQHDJHQ==
X-Received: by 2002:aa7:93a6:: with SMTP id x6mr3341479pff.72.1582877599463;
 Fri, 28 Feb 2020 00:13:19 -0800 (PST)
Received: from taoren-ubuntuvm (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id c18sm8717917pgw.17.2020.02.28.00.13.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Feb 2020 00:13:19 -0800 (PST)
Date: Fri, 28 Feb 2020 00:13:11 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v5 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200228081309.GA4531@taoren-ubuntuvm>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
 <20200227230507.8682-8-rentao.bupt@gmail.com>
 <3150424b9e9f5856c747a0fbf44647919f49209d.camel@kernel.crashing.org>
 <20200228010444.GA19910@taoren-ubuntu-R90MNF91>
 <2676013663fc8c53e02a5fdaafb1b27e18249b80.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2676013663fc8c53e02a5fdaafb1b27e18249b80.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 02:02:28PM +1100, Benjamin Herrenschmidt wrote:
> On Thu, 2020-02-27 at 17:05 -0800, Tao Ren wrote:
> > > Also long run I think best is going to have a child node per downstream
> > > port, so we create a matching linux struct device. This will make it
> > > easier to deal with the other device-controller in the ast2600 which is
> > > basically one of these without a vhub above it.
> > 
> > Maybe a dumb question: what would be the proper place to parse the child
> > node/properties when they are added? For example, in some usb_gadget_ops
> > callback?
> 
> No. What the vhub would do is when it probes, it creates a platform
> device for each "port" child node that's linked to the DT node.
> 
> The driver for the device then attaches to it via standard DT matching
> and checks if it has a vhub parent or not, and based on that, operates
> as a vhub child device or a standalone one.
> 
> (For example, it might have different functions for EP selection since
> standalone devices have private EPs rather than a shared pool)
> 
> They can both be in the same module or they can be separate modules
> with cross dependencies.
> 
> Cheers,
> Ben.

I see. It's to describe these downstream devices (such as configurations
and according functions) in device tree, which is similar to defining a
composite device and linking functions/interfaces via configfs. Thanks for
the clarify.


Cheers,

Tao
