Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C6A734A
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2019 21:13:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGnR3cTWzDqlj
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Sep 2019 05:13:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=maennich@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MidKkLyv"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D8XZ6k9BzDr99
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 00:03:51 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id c5so2069109wmb.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=MidKkLyv9HQjM9YsTFAD+JjCp0plA1IFovR06fjrPRys0G/br9M706YWoy8q4p5/+u
 KHMnu8KUpMSUR+rUPfBWFC1tcN4nmqkp824MEEu4bKTGz4TqaBozd1S1lfhlZGvURoXQ
 2iSG6SwE2o3O0d4g5BsHAAjQIRjUJD9p6MyAJMgX4QH9ynSqrn8UBIZ3TCXVJ2LbK9db
 EpUvt2+anuLDXYizRUoFQcdngZ/yDsVOEtN0fM8qnMdbPA9bQjtPBqJzQo2aiU9/HbN6
 SDkBqgZc0sCcrnr7GIF4NjYAPRRmkBwwUFWHE2aa0RrPCig66hntOKeL8+fD4F27he+P
 q2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=ujAtMsmIsRO2ElL6qqGzOe7diCcb/3/f5S7KtEcfaJ+iE+zkjg445bl6tD6PAp2SD8
 ySZ092zd6Lqf+tzvpEswA4fTRVkPRmmOshcC4LaIiVK0NUOY6FOrQ+VF2c+Ud9nqKwsl
 Ds7MU9ixkpNx5puw20K8fQjaRcPO1JcOadee7TwZkFPbAkIuRHVk3LJRKafASROBjVIL
 5LsQPY1Twohjbj+gE+xkqLOFlo3twdcmyJwWOg7FruxaaALt27WWB4yN0iGVT1hEssf1
 tSo7PbfOb4ntCz3Dp0Dcm0LVwUBMWiphMqtMt624EXOTuCSak2KCl7YvcMjCeThCkf3S
 6zLw==
X-Gm-Message-State: APjAAAVifwD3fDQ1U5EQbnkdeQtqVx6Vh7BhBQwM6/mQIBjIKdlR+R+u
 TbvmQXPrE8sRJS4+1FAMXI4JDQ==
X-Google-Smtp-Source: APXvYqystIzk+HhGz6Qa4p93wRRKjwZmEcSqSZ+P4isDGvGod84XS7SVOqOw9UvX3/TfshAObReWaw==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr173265wmk.79.1566396225923;
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
 by smtp.gmail.com with ESMTPSA id g7sm170768wme.17.2019.08.21.07.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Date: Wed, 21 Aug 2019 15:03:41 +0100
From: Matthias Maennich <maennich@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
Message-ID: <20190821140341.GA126314@google.com>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821131140.GC2349@hirez.programming.kicks-ass.net>
 <20190821133846.GC4890@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190821133846.GC4890@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 04 Sep 2019 05:12:13 +1000
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
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, usb-storage@lists.one-eyed-alien.net,
 mingo@redhat.com, geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Patrick Venture <venture@google.com>,
 stern@rowland.harvard.edu, kernel-team@android.com,
 Ingo Molnar <mingo@kernel.org>, linux-rtc@vger.kernel.org,
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, sspatil@google.com,
 linux-watchdog@vger.kernel.org, arnd@arndb.de, linux-kbuild@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 pombredanne@nexb.com, Dan Williams <dan.j.williams@intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, maco@android.com, linux-arm-kernel@lists.infradead.org,
 Adrian Reber <adrian@lisas.de>, linux-hwmon@vger.kernel.org,
 michal.lkml@markovi.net, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, jeyu@kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 21 Aug, 06:38, Greg Kroah-Hartman wrote:
>On Wed, Aug 21, 2019 at 03:11:40PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
>> > As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
>> > That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
>> > seems to be some consensus amongst kernel devs that the export surface
>> > is too large, and hard to reason about.
>> >
>> > Generally, these symbols fall in one of these categories:
>> > 1) Symbols actually meant for drivers
>> > 2) Symbols that are only exported because functionality is split over
>> >    multiple modules, yet they really shouldn't be used by modules outside
>> >    of their own subsystem
>> > 3) Symbols really only meant for in-tree use
>> >
>> > When module developers try to upstream their code, it regularly turns
>> > out that they are using exported symbols that they really shouldn't be
>> > using. This problem is even bigger for drivers that are currently
>> > out-of-tree, which may be using many symbols that they shouldn't be
>> > using, and that break when those symbols are removed or modified.
>> >
>> > This patch allows subsystem maintainers to partition their exported
>> > symbols into separate namespaces, and module authors to import such
>> > namespaces only when needed.
>> >
>> > This allows subsystem maintainers to more easily limit availability of
>> > these namespaced symbols to other parts of the kernel. It can also be
>> > used to partition the set of exported symbols for documentation
>> > purposes; for example, a set of symbols that is really only used for
>> > debugging could be in a "SUBSYSTEM_DEBUG" namespace.
>>
>> I'm missing how one can prohibit these random out of tree modules from
>> doing MODULE_IMPORT_NS().
>
>Nothing, but then they are explicitly being "bad" :)
>

As a side effect of this implementation (namespace imports via modinfo
tags), imports are very visible for (out-of-tree) modules, e.g.

$ modinfo drivers/usb/storage/ums-usbat.ko
  filename:       drivers/usb/storage/ums-usbat.ko
  import_ns:      USB_STORAGE
  license:        GPL
  author:         ...
  ...

>> That is; suppose I stick all the preempt_notifier symbols in a KVM
>> namespace, how do I enforce no out-of-tree modules ever do
>> MODULE_IMPORT_NS(KVM) and gain access?
>>

That is actually a feature worth following up: Restricting the
namespaces that can be imported by modules. I am afraid it is not part
of this series, but should not be too hard once agreed how such a list
will be defined.

>> (the above would basically break virtualbox, which I knows uses preempt
>> notifiers too, but I don't give a rats arse about that)
>
>It's a huge red flag for anyone reviewing the code that this module is
>doing something it probably really should not be doing at all.  It will
>make reviewing code easier, this isn't there to try to "prevent bad
>actors" at all, sorry.
>

Cheers,
Matthias
