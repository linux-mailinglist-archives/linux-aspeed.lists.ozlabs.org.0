Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48313B92A
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2020 06:43:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yGTB5C9gzDqRf
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jan 2020 16:43:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=h+DJfabl; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yGT33JGYzDqBx
 for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jan 2020 16:43:18 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id z14so14606946qkg.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Jan 2020 21:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VV6aOYpoC2q2Em6EQrcwUhEq6b9Yl+28VpEwnLT0CsA=;
 b=h+DJfablG7916162OA00JdupY60BQAzyzEv95mMuZPj6EFv2tNxCR8FZf+peJo36b7
 pkWojonjP1i46YVBFo0pHRsrODOkUxsDxeo+Tcd1sMRbpiw1S/dHzRwKSEjGc2oHbyXf
 QXO43pQ4Y38n6Y0hJeK0Oi7H1i7q2/iFqFOn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VV6aOYpoC2q2Em6EQrcwUhEq6b9Yl+28VpEwnLT0CsA=;
 b=Om6aZUtm2jHWrPfsu/xcCNqVCq7e+En9V6ljBiu6eV1/IKfbPyhvJXd3v8pTUgt+gS
 T3WA8HYlvvZcrWLuQ/b4lzNwNdVsMEoC9ljckDs5N7/loyE+SlzPVSG/ycAlKcP/Al9F
 nd8sGTPcJ9cJZbeAcR1uTT9OHB+U3tZ3m3Vj8uZIPvyrhRLxEWAm4mNSYrZD6hARxKtT
 QyV9qfWVmmKi5GDCIrgsOBsPsxRvpPmwhNf8FE5pGRTj+0ua0kiivgZi40q2Ei1rRRnE
 Lur52SZzd7gQ8ayUqizg4RqH8Izwg7vpA+vsWRn3mA6Pz9BLW5sa/+hrPUM+NhmReuVl
 UC/w==
X-Gm-Message-State: APjAAAWwtnxhYOEnwv8JAyyVGQpxLFcb9ncJv7yj92MKNWmLma6+eQ/N
 MP/ydE4OvJO8Oe+oFa5yhpuaopdhWqrn38eErLE=
X-Google-Smtp-Source: APXvYqwrOmTBUExJJT1fUGv0npZvc0tXC2tVGawXY0yYpOu8/dlawk5v470gu5OXo54xyHwuUXcwtRpVGMvlfZrhZdY=
X-Received: by 2002:ae9:e702:: with SMTP id m2mr20840949qka.208.1579066995074; 
 Tue, 14 Jan 2020 21:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
 <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
In-Reply-To: <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Jan 2020 05:43:03 +0000
Message-ID: <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jan 2020 at 19:53, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel,
>
> On 1/13/2020 10:15 PM, Joel Stanley wrote:
> > On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> BCLK for PCI/PCIe bus should be enabled always with having the
> >> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
> >> initcall phase as an unused clock, and eventually it causes
> >> unexpected behavior on BMC features that are connected to the host
> >> through PCI/PCIe bus.
> >
> > This is true for systems that have PCIe connected. There are systems
> > that do not, and in that case we don't want to have the clock enabled.
> >
> > Are you doing this to support the case where the PCIe device not load
> > a BMC driver? (eg for host VGA use). If not, then you can have the
> > driver you're loading request the BCLK.
> >
> > If this is for the host VGA device, then you will need to come up with
> > a mechanism that makes the enabling of this clock depend on the device
> > tree.
>
> Is there any way to enable clock by just adding a node in device tree?
> Do you want me to add a simple driver module for host VGA just for
> enabling BCLK?

Okay, so this is for the case where we lack a BMC driver.

One option would be to do as you suggest, adding a simple driver that
claims essential clocks.

Another could be to add some extra properties that clock driver parses
and enables the clocks.
