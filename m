Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE197EC57
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 07:51:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460GWQ4yx3zDqvN
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2019 15:51:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ZlXyZ6zt"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460GWK0bzWzDqsp
 for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2019 15:51:38 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id n11so72754428qtl.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2019 22:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ITQyJRBl7ht1TYk00a4jNJ9PbzaX8Bwy7nVWaA9ibU=;
 b=ZlXyZ6ztAsHkWX/gNtW3rbHVMXIy8YlD4tZkfmEg2K2GZWwrJbhbsffFVc4OaXLrg9
 4tTqk4gATmYjzkZBvV6sH+07OauO8iQOl7F9IrPpZzBS6Z/6Juf2gv2baaqlQJdyWdqq
 U2PcA4vf7asSgaO+0RaIZUlir57+Jn+ToB2VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ITQyJRBl7ht1TYk00a4jNJ9PbzaX8Bwy7nVWaA9ibU=;
 b=jMQxhzrk1WvcGLeL112NqXdu5ELSJbKOkIRf/uQABrBtcYvEzW8ZEz/xYRNE7CvBcw
 0CUTsLglnTJMwwCB867wF/LjlHeBuX1Z37krz5eyH0Fa1mwm7o9Syg/RU/VLRNG1yebJ
 U4/Qv4zlF3bTIGYawLTEYNlXk72VwxsHIzAOIGD4khAieuy9wmomP+daCVi6EfzmFNvj
 ScoFIyMP5rAUrVGPxM3+VRdhHT/tAgU+GfIhLUCCg/uf2sU3t84R5c3khgC34nE9Bm2C
 8MZAOkKxjlKkcoZY7g16aqbAFXu6tNE5lyflUgyx97ImWUxfzKrVlZhUWPHSPvd7PvJB
 29mg==
X-Gm-Message-State: APjAAAU4lk8o4lGsXD+b9blyiWQ/0K81BcX7mrq6gYp/oTIs/OJL+5Zz
 9hgm+4c+4O1SlcaMyWhcjg/sOoKFRICQ0WyDlMs=
X-Google-Smtp-Source: APXvYqxO7iXCAjOTakLYUnlXhbQV3QpIiWAYTjbetNNaVVixnu8M5TKpFH8tA3QT0jtpa2v4Vzycy56QBDbI0RnB0tU=
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr97854130qvv.38.1564725094592; 
 Thu, 01 Aug 2019 22:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190726053959.2003-1-andrew@aj.id.au>
 <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
 <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
In-Reply-To: <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 05:51:23 +0000
Message-ID: <CACPK8Xc4Vigeu1B1Su5392BSCSKfoEDqt_tiDtgKmNH5ucAvAg@mail.gmail.com>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, Xo Wang <xow@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Ken Chen <chen.kenyy@inventec.com>,
 Adriana Kobylak <anoo@us.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?= <yang.brianc.w@inventec.com>,
 openipmi-developer@lists.sourceforge.net,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yao.yuan@linaro.org, Patrick Venture <venture@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 30 Jul 2019 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:

> > > The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> > > the remaining warnings (which we can't feasibly remove), but doing so forces
> > > code changes (which I'd avoided up until this point).
> > >
> > > Reflecting broadly on the fixes, I think I've made a mistake way back by using
> > > syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> > > devicetree. This series cleans up what's currently there, but I have half a
> > > mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> > > driver implementation that uses `platform_device_register_full()` or similar to
> > > deal with the mess.
> > >
> > > Rob - I'm looking for your thoughts here and on the series, I've never felt
> > > entirely comfortable with what I cooked up. Your advice would be appreciated.
> >
> > The series generally looks fine to me from a quick scan. As far as
> > dropping 'simple-mfd', having less fine grained description in DT is
> > generally my preference. It comes down to whether what you have
> > defined is maintainable. As most of it is just additions, I think what
> > you have is fine. Maybe keep all this in mind for the next chip
> > depending how the SCU and LPC change.
>
> Okay, I think the timing of that suggestion is good given where things are with
> the AST2600. I'll keep that in mind.
>
> Consensus so far seems to be that the series is fine. I'll split it up and send out
> the sub-series to the relevant lists with the acks accumulated here.

The series look good. I suggest posting the KCS bindings and driver
changes as their own series to go through the IPMI tree.

Please add my tag to all the patches except the OCC one, which I need
to do some investigation in to.

Reviewed-by: Joel Stanley <joel@jms.id.au>

The others can go via the aspeed tree. Perhaps post them as their own
series too so I don't get confused and apply the wrong ones. That way
if Rob wants to send his reviewed-by he can.

Cheers,

Joel
