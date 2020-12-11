Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D92DB848
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Dec 2020 02:13:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cwcb44BKlzDqJh
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Dec 2020 12:13:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=e2yI+Ipl; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsYzy13GMzDqkd
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Dec 2020 13:06:19 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id o25so8156682oie.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Dec 2020 18:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f9RSyWHl3Z1A9igwbyiPb+HKfrL5RmW/7S10//clEIc=;
 b=e2yI+Iplee0/vctTdk8XUsTgKJ7vxYwhrkV2a5JcjCHSrCc2JRRAb64vCVfsV7yo78
 B0ZNIum9QeuLW3JNwUuaZG2g3bxfLuTUkStSp4GcrnHR6b8aD2Qmu4beiT2tlp1Xk2uj
 i85VZRIc2PPfL0mUEg+9jE+n36rrkc2HX6ZuTgjxVFN0X4I11Z8HwAa/kA9GZWqcHwBk
 l77av4ppjbBvFERMzXJyIApvE62pju92vDXmohXXDF5Vqi+KkqV8HH8t8qdhWjlxmMJS
 D8KLMcTacHU/v/6HJSMsAdX8qKruqZqekPjW2AfUob9e1Imxo4+qvUVHofsCjxYLg1PQ
 9mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f9RSyWHl3Z1A9igwbyiPb+HKfrL5RmW/7S10//clEIc=;
 b=njUXBxro59be1DkEI4qhjNtKiVhB0YQFUq3V6aD0NyXPRpKbB208iZjDmdVvrV8yX3
 7z6tLCWOMqJ5TENVtCl0/a8jyNkJGj57SOlTIJzPe7W3BwjgoPUCi6oCrB7ApvZhY2ef
 xLH8ovrcbst0QKxG+ktH8Bx4bHDlFRoWnftwfJvc2YZvsdO1fhDiYbkLItuSLmNOMHKn
 a0oAkUVWTLcEIUDdOsJD3PHgDDOtuS8271pDrWAcziMV0I6lLt3MyYCIDlORqzkzH00D
 ZmRJd/oE2bzTafun9HU3UjJqAFVxHhN92Eg5PzB9pUQBj+ZGwrW2fSrNC43gk4M2u/hF
 FJHA==
X-Gm-Message-State: AOAM531l1846ucMHWh+1cENAsAofppUMnCgLzjOQPTLX2zR/UOjgPDYz
 B5VnJCxtazWK3dG8YEoCm38SoR14vt/2nV6oEDSQuQ==
X-Google-Smtp-Source: ABdhPJzs0/lE6TSq5HnlKNF+j99NifDWVBECFpzx5ngO00Z+i5z0ERHOjWxD76IkEiusio5CVOYgPLUR+7AXcIsYuE0=
X-Received: by 2002:aca:5e03:: with SMTP id s3mr7651344oib.125.1607652376343; 
 Thu, 10 Dec 2020 18:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20201210092853.303-1-wangzhiqiang.bj@bytedance.com>
 <X9HtwHo8s6e2UsAT@kroah.com>
 <CAH0XSJt3=XJ_gQb2rTvbUcbyow2k7E4jfuKGKAKdi+nwdfauVw@mail.gmail.com>
 <X9H4r3XZynGtSDw0@kroah.com>
 <CABoTLcSiCsASu_prfxH_sZrm-njcYzkcvrrpS1envj7QvxYtNA@mail.gmail.com>
In-Reply-To: <CABoTLcSiCsASu_prfxH_sZrm-njcYzkcvrrpS1envj7QvxYtNA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 11 Dec 2020 10:06:05 +0800
Message-ID: <CAGm54UFJt2PHJThigVYLrgKqBz7rNF-vWYFJ5wykBx+GPjzihw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] misc: aspeed: Add Aspeed UART routing
 control driver.
To: Oskar Senft <osk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Dec 2020 12:13:43 +1100
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Yong Li <yong.b.li@linux.intel.com>, open list <linux-kernel@vger.kernel.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Lotus Xu <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Dec 10, 2020 at 8:33 PM Oskar Senft <osk@google.com> wrote:
>
> The purpose of this driver is to allow manipulation of the UART routing a=
t runtime. Setting the routing in the DTS would obviously not allow that.
>
> From what I remember, I used am existing unrelated driver as template. Ap=
ologies for using the wrong APIs - I literally just followed what I had see=
n elsewhere.
>
> Since posting this driver, we found that while it solved our initial use =
case, that use case has evolved. We're now using Aspeed's VUART where bytes=
 are routed "manually" (i.e. copied between devices) rather than in hardwar=
e. So I don't need this driver anymore.
>
> If it's still useful to anyone, please take ownership and modify it as ne=
eded to be able to submit it. I'm still happy to keep an eye on it and help=
 explain its purpose.
>

The driver is useful for our system, and it's used in intel-openbmc as well=
.
We (John and I work for the same employer) have the chance to use
Andrew Jefery's ["bmc-misc" driver][1] to configure the various
registers in dts to setup the UART routing, but that driver was not
accepted by upstream.

So we end up sending this patch here for upstream's comment.
If it's considered not a good option, we will have to keep it downstream.

[1] https://lore.kernel.org/openbmc/20180711053122.30773-1-andrew@aj.id.au/

--=20
BRs,
Lei YU
