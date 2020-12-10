Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7302D5F6E
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Dec 2020 16:22:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHhr6y2xzDqty
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Dec 2020 02:22:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YYXUno8h; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsD4p0FzHzDqTv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 23:39:19 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id g20so7129293ejb.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 04:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0cq5HYVqviKhkEkUWRVtYkM6KW8/jNL8/e2Go6gn4Y=;
 b=YYXUno8h/l9zXf3o5UAUYDBsYvWYF8Gmz6BKPgzNJGUXq7d4f3Cdr2ADMHbEllUj+a
 lVWHfL8O2g8RI6v6YHBWhBxlnYZ4n39IqdzMiKXMzVAMm/x1MqUy+Gy8tRC0GEtuTrSt
 FVI6ZaheUpVVfCxEfCTUccZy3bA+nCxMbvXvMzh1MDhwguCW8IhvFxMwjLylsHd9kETe
 TOisur23gsMj63EU16k6KRNZGgtLrOJv2vtMscMCvTLD83Y7VKAsYyJ/kpS9+ayKK0Q9
 sPtB3uG8jknm2Uu3ERAgh8T0D28dFzgdb61ijg/CTrkV38WmSq0lnVSCbGEyWnbouXU+
 K9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0cq5HYVqviKhkEkUWRVtYkM6KW8/jNL8/e2Go6gn4Y=;
 b=HgSE8pEBuwVT3ybzKqSxyjHYolsQ36fhqZPI3yD5e2qz5U4KTvIlMrabe46/Zg+VCu
 gLiS00dM5G6ChILuN6ef0tMzv66zNJytMV6AVCaZixXsNpFa8YXnFrR5tgWUoEvCWnX8
 S9dj+6zl1C1koc/CEX6HyOnmMRfNR24CVImTdA4mnEY1DYjvG61uNKzhP0UCWaG+khCG
 RHBKtbDEbeS3Rmxb8HvWedezHDVfukfIh4qyyR0bVGPLXBq7GM0SJeevydBxeYah/joF
 O5hOviOMMmp5Sg/utjAFiObP08OqSxZDQanD2uQSz/36/VNPPGVeEv8HwdWsnKQGbNwX
 cQ0Q==
X-Gm-Message-State: AOAM531zkkfGi/npgPoFDd6MXJAZjL7V8Y4R2m2IUCKqu/FECOlob1uu
 GpI69yQWkKVfr/cEcsSyiePjHhnIWgTdMCDZiDE8kifwAb90Xg==
X-Google-Smtp-Source: ABdhPJwFpTFLd45FdGycDYv+8JY4LjtCPHnJmD9Bnxij7y8ZLiTAwHp0oA9jM3PyE3nIRzDs+tyoLCqNXqOkcuqIZpQ=
X-Received: by 2002:a2e:94d:: with SMTP id 74mr2828750ljj.104.1607603637293;
 Thu, 10 Dec 2020 04:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20201210092853.303-1-wangzhiqiang.bj@bytedance.com>
 <X9HtwHo8s6e2UsAT@kroah.com>
 <CAH0XSJt3=XJ_gQb2rTvbUcbyow2k7E4jfuKGKAKdi+nwdfauVw@mail.gmail.com>
 <X9H4r3XZynGtSDw0@kroah.com>
In-Reply-To: <X9H4r3XZynGtSDw0@kroah.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 10 Dec 2020 07:33:44 -0500
Message-ID: <CABoTLcSiCsASu_prfxH_sZrm-njcYzkcvrrpS1envj7QvxYtNA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] misc: aspeed: Add Aspeed UART routing
 control driver.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bdeb3405b61b633e"
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 Yong Li <yong.b.li@linux.intel.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Lotus Xu <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000bdeb3405b61b633e
Content-Type: text/plain; charset="UTF-8"

The purpose of this driver is to allow manipulation of the UART routing at
runtime. Setting the routing in the DTS would obviously not allow that.

From what I remember, I used am existing unrelated driver as template.
Apologies for using the wrong APIs - I literally just followed what I had
seen elsewhere.

Since posting this driver, we found that while it solved our initial use
case, that use case has evolved. We're now using Aspeed's VUART where bytes
are routed "manually" (i.e. copied between devices) rather than in
hardware. So I don't need this driver anymore.

If it's still useful to anyone, please take ownership and modify it as
needed to be able to submit it. I'm still happy to keep an eye on it and
help explain its purpose.

Oskar.

On Thu, Dec 10, 2020, 5:28 AM Greg Kroah-Hartman <gregkh@linuxfoundation.org>
wrote:

> On Thu, Dec 10, 2020 at 06:06:59PM +0800, John Wang wrote:
> > On Thu, Dec 10, 2020 at 5:42 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Dec 10, 2020 at 05:28:53PM +0800, John Wang wrote:
> > > > From: Oskar Senft <osk@google.com>
> > > >
> > > > This driver adds sysfs files that allow the BMC userspace to
> configure
> > > > how UARTs and physical serial I/O ports are routed.
> > > >
> > > > Tested: Checked correct behavior (both read & write) on TYAN S7106
> > > > board by manually changing routing settings and confirming that bits
> > > > flow as expected. Tested for UART1 and UART3 as this board doesn't
> have
> > > > the other UARTs wired up in a testable way.
> > > >
> > > > Signed-off-by: Oskar Senft <osk@google.com>
> > > > Signed-off-by: Yong Li <yong.b.li@linux.intel.com>
> > > > Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > > > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> > > > ---
> > > >  .../stable/sysfs-driver-aspeed-uart-routing   |  14 +
> > > >  .../misc-devices/aspeed-uart-routing.txt      |  49 +++
> > > >  drivers/misc/Kconfig                          |   6 +
> > > >  drivers/misc/Makefile                         |   1 +
> > > >  drivers/misc/aspeed-uart-routing.c            | 383
> ++++++++++++++++++
> > > >  5 files changed, 453 insertions(+)
> > > >  create mode 100644
> Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
> > > >  create mode 100644
> Documentation/misc-devices/aspeed-uart-routing.txt
> > > >  create mode 100644 drivers/misc/aspeed-uart-routing.c
> > > >
> > > > diff --git
> a/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
> b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
> > > > new file mode 100644
> > > > index 000000000000..5068737d9c12
> > > > --- /dev/null
> > > > +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
> > > > @@ -0,0 +1,14 @@
> > > > +What:
> /sys/bus/platform/drivers/aspeed-uart-routing/*/io*
> > > > +Date:                August 2018
> > > > +Contact:     Oskar Senft <osk@google.com>
> > > > +Description: Configures the input source for the specific physical
> > > > +             serial I/O port.
> > > > +Users:               OpenBMC.  Proposed changes should be mailed to
> > > > +             openbmc@lists.ozlabs.org
> > > > +
> > > > +What:
> /sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
> > > > +Date:                August 2018
> > > > +Contact:     Oskar Senft <osk@google.com>
> > > > +Description: Configures the input source for the specific UART.
> > > > +Users:               OpenBMC.  Proposed changes should be mailed to
> > > > +             openbmc@lists.ozlabs.org
> > > > diff --git a/Documentation/misc-devices/aspeed-uart-routing.txt
> b/Documentation/misc-devices/aspeed-uart-routing.txt
> > > > new file mode 100644
> > > > index 000000000000..cf1c2a466875
> > > > --- /dev/null
> > > > +++ b/Documentation/misc-devices/aspeed-uart-routing.txt
> > > > @@ -0,0 +1,49 @@
> > > > +Kernel driver aspeed-uart-routing
> > > > +=================================
> > > > +
> > > > +Supported chips:
> > > > +ASPEED AST2500/AST2600
> > > > +
> > > > +Author:
> > > > +Google LLC
> > > > +
> > > > +Description
> > > > +-----------
> > > > +
> > > > +The Aspeed AST2500/AST2600 allows to dynamically route the inputs
> for the
> > > > +built-in UARTS and physical serial I/O ports.
> > > > +
> > > > +This allows, for example, to connect the output of UART to another
> UART.
> > > > +This can be used to enable host<->BMC communication via UARTs, e.g.
> to allow
> > > > +access to the host's serial console.
> > > > +
> > > > +This driver is for the BMC side. The sysfs files allow the BMC
> userspace
> > > > +which owns the system configuration policy, to configure how UARTs
> and
> > > > +physical serial I/O ports are routed.
> > > > +
> > > > +The driver provides the following files in sysfs:
> > > > +uart1                Configure the input signal to UART1.
> > > > +uart2                Configure the input signal to UART2.
> > > > +uart3                Configure the input signal to UART3.
> > > > +uart4                Configure the input signal to UART4.
> > > > +uart5                Configure the input signal to UART5.
> > > > +io1          Configure the input signal to physical serial port 1.
> > > > +io2          Configure the input signal to physical serial port 2.
> > > > +io3          Configure the input signal to physical serial port 3.
> > > > +io4          Configure the input signal to physical serial port 4.
> > > > +io5          Configure the input signal to physical serial port 5.
> > > > +
> > > > +When read, each file shows the list of available options with the
> currently
> > > > +selected option marked by square brackets "[]". The list of
> available options
> > > > +depends on the selected file.
> > > > +
> > > > +Example:
> > > > +$ cat
> /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> > > > +[io1] io2 io3 io4 uart2 uart3 uart4 io6
> > > > +
> > > > +In this case, UART1 gets its input signal from IO1 (physical serial
> port 1).
> > > > +
> > > > +$ echo -n "uart3" \
> > > > +
> >/sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> > > > +$ cat
> /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> > > > +io1 io2 io3 io4 uart2 [uart3] uart4 io6
> > >
> > > Are you sure there are no other ways to configure this type of thing,
> > > than to a driver-specific sysfs file?
> >
> > I think this is good. but what's your suggestion?
>
> I do not know, but isn't this normally handled in a dts file?  Why must
> it be done "on the fly" like this?
>
> > If I use a driver-specific sysfs and modify the code based on the
> > comments, is this a good direction to go?
>
> That's what you are trying to do here, and is why I am objecting to it
> :)
>
> thanks,
>
> greg k-h
>

--000000000000bdeb3405b61b633e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>The purpose of this driver is to allow manipulation =
of the UART routing at runtime. Setting the routing in the DTS would obviou=
sly not allow that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">From=
 what I remember, I used am existing unrelated driver as template. Apologie=
s for using the wrong APIs - I literally just followed what I had seen else=
where.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Since posting thi=
s driver, we found that while it solved our initial use case, that use case=
 has evolved. We&#39;re now using Aspeed&#39;s VUART where bytes are routed=
 &quot;manually&quot; (i.e. copied between devices) rather than in hardware=
. So I don&#39;t need this driver anymore.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">If it&#39;s still useful to anyone, please take ownershi=
p and modify it as needed to be able to submit it. I&#39;m still happy to k=
eep an eye on it and help explain its purpose.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Oskar.<br><br><div class=3D"gmail_quote" dir=3D"auto=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020, 5:28 AM Greg =
Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfoundation.org" target=3D"_=
blank" rel=3D"noreferrer">gregkh@linuxfoundation.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Thu, Dec 10, 2020 at 06:06:59PM +0800, =
John Wang wrote:<br>
&gt; On Thu, Dec 10, 2020 at 5:42 PM Greg Kroah-Hartman<br>
&gt; &lt;<a href=3D"mailto:gregkh@linuxfoundation.org" rel=3D"noreferrer no=
referrer" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Dec 10, 2020 at 05:28:53PM +0800, John Wang wrote:<br>
&gt; &gt; &gt; From: Oskar Senft &lt;<a href=3D"mailto:osk@google.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">osk@google.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This driver adds sysfs files that allow the BMC userspace to=
 configure<br>
&gt; &gt; &gt; how UARTs and physical serial I/O ports are routed.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Tested: Checked correct behavior (both read &amp; write) on =
TYAN S7106<br>
&gt; &gt; &gt; board by manually changing routing settings and confirming t=
hat bits<br>
&gt; &gt; &gt; flow as expected. Tested for UART1 and UART3 as this board d=
oesn&#39;t have<br>
&gt; &gt; &gt; the other UARTs wired up in a testable way.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Oskar Senft &lt;<a href=3D"mailto:osk@google.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">osk@google.com</a>&gt;=
<br>
&gt; &gt; &gt; Signed-off-by: Yong Li &lt;<a href=3D"mailto:yong.b.li@linux=
.intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank">yong.b.li@linux=
.intel.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Vernon Mauery &lt;<a href=3D"mailto:vernon.ma=
uery@linux.intel.com" rel=3D"noreferrer noreferrer" target=3D"_blank">verno=
n.mauery@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: John Wang &lt;<a href=3D"mailto:wangzhiqiang.=
bj@bytedance.com" rel=3D"noreferrer noreferrer" target=3D"_blank">wangzhiqi=
ang.bj@bytedance.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../stable/sysfs-driver-aspeed-uart-routing=C2=A0 =C2=
=A0|=C2=A0 14 +<br>
&gt; &gt; &gt;=C2=A0 .../misc-devices/aspeed-uart-routing.txt=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 49 +++<br>
&gt; &gt; &gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<=
br>
&gt; &gt; &gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt; &gt; &gt;=C2=A0 drivers/misc/aspeed-uart-routing.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 383 ++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 5 files changed, 453 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 Documentation/ABI/stable/sysfs-driv=
er-aspeed-uart-routing<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 Documentation/misc-devices/aspeed-u=
art-routing.txt<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/misc/aspeed-uart-routing.c<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-ua=
rt-routing b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..5068737d9c12<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-rout=
ing<br>
&gt; &gt; &gt; @@ -0,0 +1,14 @@<br>
&gt; &gt; &gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /sys/bus/platform/drivers/aspeed-uart-routing/*/io*<br>
&gt; &gt; &gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 August 2018<br>
&gt; &gt; &gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mail=
to:osk@google.com" rel=3D"noreferrer noreferrer" target=3D"_blank">osk@goog=
le.com</a>&gt;<br>
&gt; &gt; &gt; +Description: Configures the input source for the specific p=
hysical<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial I/O =
port.<br>
&gt; &gt; &gt; +Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0OpenBMC.=C2=A0 Proposed changes should be mailed to<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"=
mailto:openbmc@lists.ozlabs.org" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">openbmc@lists.ozlabs.org</a><br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /sys/bus/platform/drivers/aspeed-uart-routing/*/uart*<br>
&gt; &gt; &gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 August 2018<br>
&gt; &gt; &gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mail=
to:osk@google.com" rel=3D"noreferrer noreferrer" target=3D"_blank">osk@goog=
le.com</a>&gt;<br>
&gt; &gt; &gt; +Description: Configures the input source for the specific U=
ART.<br>
&gt; &gt; &gt; +Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0OpenBMC.=C2=A0 Proposed changes should be mailed to<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"=
mailto:openbmc@lists.ozlabs.org" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">openbmc@lists.ozlabs.org</a><br>
&gt; &gt; &gt; diff --git a/Documentation/misc-devices/aspeed-uart-routing.=
txt b/Documentation/misc-devices/aspeed-uart-routing.txt<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..cf1c2a466875<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/Documentation/misc-devices/aspeed-uart-routing.txt<br>
&gt; &gt; &gt; @@ -0,0 +1,49 @@<br>
&gt; &gt; &gt; +Kernel driver aspeed-uart-routing<br>
&gt; &gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Supported chips:<br>
&gt; &gt; &gt; +ASPEED AST2500/AST2600<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Author:<br>
&gt; &gt; &gt; +Google LLC<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Description<br>
&gt; &gt; &gt; +-----------<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The Aspeed AST2500/AST2600 allows to dynamically route the =
inputs for the<br>
&gt; &gt; &gt; +built-in UARTS and physical serial I/O ports.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This allows, for example, to connect the output of UART to =
another UART.<br>
&gt; &gt; &gt; +This can be used to enable host&lt;-&gt;BMC communication v=
ia UARTs, e.g. to allow<br>
&gt; &gt; &gt; +access to the host&#39;s serial console.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +This driver is for the BMC side. The sysfs files allow the =
BMC userspace<br>
&gt; &gt; &gt; +which owns the system configuration policy, to configure ho=
w UARTs and<br>
&gt; &gt; &gt; +physical serial I/O ports are routed.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +The driver provides the following files in sysfs:<br>
&gt; &gt; &gt; +uart1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Configure the input signal to UART1.<br>
&gt; &gt; &gt; +uart2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Configure the input signal to UART2.<br>
&gt; &gt; &gt; +uart3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Configure the input signal to UART3.<br>
&gt; &gt; &gt; +uart4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Configure the input signal to UART4.<br>
&gt; &gt; &gt; +uart5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Configure the input signal to UART5.<br>
&gt; &gt; &gt; +io1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure the input s=
ignal to physical serial port 1.<br>
&gt; &gt; &gt; +io2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure the input s=
ignal to physical serial port 2.<br>
&gt; &gt; &gt; +io3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure the input s=
ignal to physical serial port 3.<br>
&gt; &gt; &gt; +io4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure the input s=
ignal to physical serial port 4.<br>
&gt; &gt; &gt; +io5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Configure the input s=
ignal to physical serial port 5.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +When read, each file shows the list of available options wi=
th the currently<br>
&gt; &gt; &gt; +selected option marked by square brackets &quot;[]&quot;. T=
he list of available options<br>
&gt; &gt; &gt; +depends on the selected file.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Example:<br>
&gt; &gt; &gt; +$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_=
routing/uart1<br>
&gt; &gt; &gt; +[io1] io2 io3 io4 uart2 uart3 uart4 io6<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +In this case, UART1 gets its input signal from IO1 (physica=
l serial port 1).<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +$ echo -n &quot;uart3&quot; \<br>
&gt; &gt; &gt; +=C2=A0 &gt;/sys/bus/platform/drivers/aspeed-uart-routing/*.=
uart_routing/uart1<br>
&gt; &gt; &gt; +$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_=
routing/uart1<br>
&gt; &gt; &gt; +io1 io2 io3 io4 uart2 [uart3] uart4 io6<br>
&gt; &gt;<br>
&gt; &gt; Are you sure there are no other ways to configure this type of th=
ing,<br>
&gt; &gt; than to a driver-specific sysfs file?<br>
&gt; <br>
&gt; I think this is good. but what&#39;s your suggestion?<br>
<br>
I do not know, but isn&#39;t this normally handled in a dts file?=C2=A0 Why=
 must<br>
it be done &quot;on the fly&quot; like this?<br>
<br>
&gt; If I use a driver-specific sysfs and modify the code based on the<br>
&gt; comments, is this a good direction to go?<br>
<br>
That&#39;s what you are trying to do here, and is why I am objecting to it<=
br>
:)<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div></div></div>

--000000000000bdeb3405b61b633e--
