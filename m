Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD9490ADC
	for <lists+linux-aspeed@lfdr.de>; Mon, 17 Jan 2022 15:56:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcw3T2LZrz30Bc
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Jan 2022 01:56:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 310 seconds by postgrey-1.36 at boromir;
 Tue, 18 Jan 2022 01:56:49 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcw3P0KJcz2yPL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Jan 2022 01:56:48 +1100 (AEDT)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVJZv-1miM551APv-00SLxG for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jan
 2022 15:51:32 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 g81-20020a1c9d54000000b0034cd1acd9b5so2210969wme.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 17 Jan 2022 06:51:31 -0800 (PST)
X-Gm-Message-State: AOAM53255/oyCbStKqrmzgnTyb210U1RQDDTXqix6dO6gP3eMwMosIBF
 sRlUCbJujMrrxnrPX0u3G9w9MXrAW04SoHbYPYk=
X-Google-Smtp-Source: ABdhPJz0ptDEc+yX5cVaNMsNpzr1ExJC37lgKrbuG6Pso82OS1R1bYOXUvXKG2TAwUf3o5XJNUnHZW0aATTGv4WPv1A=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr28292181wmj.82.1642431091240; 
 Mon, 17 Jan 2022 06:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20211117035106.321454-1-joel@jms.id.au>
 <20211117035106.321454-4-joel@jms.id.au>
 <CACPK8XcSPiOoJZ4jyJySvCiW+EXxSVsxiEcK2eOZjGY9b1vrjA@mail.gmail.com>
In-Reply-To: <CACPK8XcSPiOoJZ4jyJySvCiW+EXxSVsxiEcK2eOZjGY9b1vrjA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Jan 2022 15:51:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3MRf0aGt1drkgsuZyBbeoy+S7Ha18SBM01q+3f33oL+Q@mail.gmail.com>
Message-ID: <CAK8P3a3MRf0aGt1drkgsuZyBbeoy+S7Ha18SBM01q+3f33oL+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: aspeed: Add secure boot controller support
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MWmQ0MxjfofJpqt/qOVEITKrbPGV3xvqetQ9GyRRVVDWgpDheOQ
 d23EVU8csqYZz8pHoUbj6DfkDHTL/1wazWIWLRhQ9QxIT9bM9JItwK4ST09oCw4sDEBMGzY
 eABoOV8EUPFREL3tjYsNsyXGekXjeFkE4CpL/gykY3KZKPpYJarpGFlHvqwC39flmq+MJtA
 Q2Upsr8aT9ekuISs7TQ5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JP/bulkmwJo=:oSeQTcOjk/0COCWGSqbbQl
 rxUAmHuezOrhbIHHBEO70kjfHqk043acso7TKgwe/PpMN5rjBXFzOo00eKj+tpxdP/lLEdzYP
 Kdbu+LbKxshMHPQd4w32w3/B+sdRWI6t8NC/yjDxj9HGnM6RB06y+/4Quymx3AkpNFhhFEstj
 3MQ+F2t8mBRfE/HxP+SZDEI2d6wRjJT2bvGtop+0oHlvLLSf1PenyZEO8Hz8zz420f25kh3Qw
 v30TvKQERInT/ppLgxZRheB3aL5raSnKjZY4vvJvWMqFzX5smvAEzbr68V+tpwB+czoUfLRe5
 GHxcS/4eeO88tOLrfE8lg5CJKPreemTg+FmS6CvWDvUSLor5IfV9TD2+3H9PriCAL16Ab5ws7
 3p8mAf71TaKmvs5GWc225c7FPL6WhC7B4ynErQDGohWaqk+qCS4WmeDGh+6klRhOQlQ2tH3th
 nfZxwr4POtwCDc8fsT+xNxyDh0CdNs72ffR/LbaAKJdqFGObDy/tEaxR8P0Bkw4159Dc8cObC
 3REc2SbYHXqrPEl4ZyEDBkuK9Ox3M6bzFp/RGr/EtlQG9j8b3vXV20pf3FvoYogzEvlBZFUvT
 l47sVt/UygUeF/4vPaxm6MggRfvf/0QHsDkIFDs8RT5RVnyJIHlJMpc3Pavh3PEhBya1Yxb++
 x6rVJhj/5Q8z+egKzsddUjh3Mvh/LnkP1jhowv5nWhRd+8wjYmUja6INuUoOzL4oE9M6NHq6J
 gImo1hn8AzC9EnxFaZsZ+yjGRJtvmXwkmUnkIaqg1RX/KJJxmAS0wgglE/49GOrEve+KmdFkq
 sR2tcK0A5zuh+uHkL1vq9JT/QVFaNowpO4Tje4Y1EAuiGxAy0c=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 12:29 AM Joel Stanley <joel@jms.id.au> wrote:
> On Wed, 17 Nov 2021 at 03:51, Joel Stanley <joel@jms.id.au> wrote:
> >
> > This reads out the status of the secure boot controller and exposes it
> > in sysfs.
> >
> > An example on a AST2600A3 QEMU model:
> >
> >  # grep . /sys/bus/soc/devices/soc0/*
> >  /sys/bus/soc/devices/soc0/abr_image:0
> >  /sys/bus/soc/devices/soc0/family:AST2600
> >  /sys/bus/soc/devices/soc0/low_security_key:0
> >  /sys/bus/soc/devices/soc0/machine:Rainier 2U
> >  /sys/bus/soc/devices/soc0/otp_protected:0
> >  /sys/bus/soc/devices/soc0/revision:A3
> >  /sys/bus/soc/devices/soc0/secure_boot:1
> >  /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
> >  /sys/bus/soc/devices/soc0/soc_id:05030303
> >  /sys/bus/soc/devices/soc0/uart_boot:1
>
> Quoting from your response to my pull request:
>
> > - I actually want to avoid custom attributes on soc device instances as much
> >   as possible. I have not looked in detail at what you add here, but the
> >   number of custom attributes means we should discuss this properly.
>
> Can you explain the reasoning here?
>
> I am a bit surprised given we have this nice feature in struct
> soc_device_attribute:
>
> struct soc_device_attribute {
> ...
>         const struct attribute_group *custom_attr_group;
> };

I have two main concerns:

- any attribute that makes sense across multiple SoC families should probably be
  part of the standard set of attributes. Ideally this could fit
within the existing
  attributes, but if you can make a reasonable case for adding further
ones, that
  is fine as well. The standard attributes can then also be accessed from within
  the kernel with soc_device_match(), rather than just being available
to user space.

- The attributes should all be used to identify the SoC, not a
particular part of
  the SoC that is better represented as a separate device.

If you are adding five attributes at once, it's likely that these
don't all fit the
constraints, though I had not yet looked at the implementation.

From what I see in

+static ssize_t abr_image_show(struct device *dev, struct
device_attribute *attr, char *buf)
+{
+       return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE));
+}
+
+static ssize_t low_security_key_show(struct device *dev, struct
device_attribute *attr, char *buf)
+{
+       return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY));
+}
+
+static ssize_t otp_protected_show(struct device *dev, struct
device_attribute *attr, char *buf)
+{
+       return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED));
+}
+
+static ssize_t secure_boot_show(struct device *dev, struct
device_attribute *attr, char *buf)
+{
+       return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT));
+}
+
+static ssize_t uart_boot_show(struct device *dev, struct
device_attribute *attr, char *buf)
+{
+       return sprintf(buf, "%d\n", !(security_status & UART_BOOT));
+}

it appears that these are related to how the system was started, which doesn't
fit either of the requirements: the same information may be useful for
non-aspeed
systems, so it would be good to have it in a standardized interface rather than
vendor extensions, and it doesn't really identify the SoC but instead provides
information from a device that is inside of the SoC.

Maybe this could be turned into a generalized interface similar to soc_device
that exposes the boot status in sysfs? We have a couple of files that
determine e.g. whether the kernel was booted securely, and those could
all hook up here. It doesn't have to be anything complex, just a node under
/sys/firmware or /sys/power that has a couple of documented attributes
that can be filled by drivers.

          Arnd
