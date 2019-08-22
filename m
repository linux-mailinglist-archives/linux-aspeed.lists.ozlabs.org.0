Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94F998B0
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 18:01:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dq6735B6zDrSH
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2019 02:01:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VYEQpTru"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dq5q18GRzDrRr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2019 02:01:34 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id w10so3919382pgj.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=98w2GcKCN663QK9TeclkQTSI7rJh8WNm1jNEnO7e0aQ=;
 b=VYEQpTruVCXeLl7kVzcZ1GS0qiWbvPwn5x3IbGR6aAqF/r+h4/bU2H+kxGqp2QEyYx
 EDEALQ0LYuCKOomqkK+UoXAkQWK3ORrCM5ziynJprIxVNXIkonT+npeLOzPJ6aqKLFxf
 G4Ak8rDlSHi7so5ebuMX5XSq4zOOyPBsJjDT9zf2yAPoIBLDHAj8+t0yUFs5hBLkJNLp
 0zzZt8FfC+fl9RMMhgGi53HXi+d669q46yc6gc/sEOiE/Clz4SRK8WkXboz7336TceCD
 6zuA/Cs3A7cdDwePnXPdMxqwVnay6j6FPv8RBapsINpKdWQBEymRcxsl/uNmCjccECUj
 uXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=98w2GcKCN663QK9TeclkQTSI7rJh8WNm1jNEnO7e0aQ=;
 b=XGgrpFo3to+sFLCmYYx5dZRSrqzeeEASUvxpH+8/y5+iLxdUxHN4Q2xJMyNykV2T8F
 hhpkVuvZ/IsNSX87vpRNKa0tuEIbPJIMU1N/YSYZxRWA3ehNKfZ/nW+MaNeMgILt5UNt
 s7TnepR3jpmXViBHhs9T5/Xtuy7YfnhYUs2gYMMC9rXjHlT6j1lziuGKx9xXAIUUtDVq
 hWbQUjyEjr28aANPWDe6f+g0yTFHecSoz4NO0ztdVQnAf5t/P6zRz5LJNP0cefoREp0/
 Mab1SEZ+V2HhZYtxGKgMHDvkQKV6z5k7Ikbx4KMIAngTbqiQAsAm96SfkAg97p/krhAY
 z2rg==
X-Gm-Message-State: APjAAAUamrxQi/MpWf8K54KR7DrVp1c+PH7FdMcqbOc+rjkN1O9jRPyv
 IP0QZj6omaQ3tPMFlBTjjL0=
X-Google-Smtp-Source: APXvYqxhzhQQCIJ9upWMd5eHMV/mPBB3qC6EoA0i0AwZ2PrrA62XyDUSenyDovW0vqb1IWGs5baOgA==
X-Received: by 2002:a62:6c1:: with SMTP id 184mr41294058pfg.230.1566489691040; 
 Thu, 22 Aug 2019 09:01:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z189sm22267905pfb.137.2019.08.22.09.01.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 09:01:29 -0700 (PDT)
Date: Thu, 22 Aug 2019 09:01:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
Message-ID: <20190822160127.GA6992@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
 <20190821181008.GB15127@roeck-us.net>
 <5cb20f52-884a-b921-c904-ebf244092318@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cb20f52-884a-b921-c904-ebf244092318@yadro.com>
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 05:36:21PM +0300, Alexander Amelkin wrote:
> 21.08.2019 21:10, Guenter Roeck wrote:
> > On Wed, Aug 21, 2019 at 08:42:24PM +0300, Alexander Amelkin wrote:
> >> 21.08.2019 19:32, Guenter Roeck wrote:
> >>> On Wed, Aug 21, 2019 at 06:57:43PM +0300, Ivan Mikhaylov wrote:
> >>>> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> >>>> to clear out boot code source and re-enable access to the primary SPI flash
> >>>> chip while booted via wdt2 from the alternate chip.
> >>>>
> >>>> AST2400 datasheet says:
> >>>> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> >>>> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> >>>> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> >>>> register WDT30.bit[1]."
> >>> Is there reason to not do this automatically when loading the module
> >>> in alt-boot mode ? What means does userspace have to determine if CS0
> >>> or CS1 is active at any given time ? If there is reason to ever have CS1
> >>> active instead of CS0, what means would userspace have to enable it ?
> >> Yes, there is. The driver is loaded long before the filesystems are mounted.
> >> The filesystems, in the event of alternate/recovery boot, need to be mounted
> >> from the same chip that the kernel was booted. For one reason because the main
> >> chip at CS0 is most probably corrupt. If you clear that bit when driver is
> >> loaded, your software will not know that and will try to mount the wrong
> >> filesystems. The whole idea of ASPEED's switching chipselects is to have
> >> identical firmware in both chips, without the need to process the alternate
> >> boot state in any way except for indicating a successful boot and restoring
> >> access to CS0 when needed.
> >>
> >> The userspace can read bootstatus sysfs node to determine if an alternate
> >> boot has occured.
> >>
> >> With ASPEED, CS1 is activated automatically by wdt2 when system fails to boot
> >> from the primary flash chip (at CS0) and disable the watchdog to indicate a
> >> successful boot. When that happens, both CS0 and CS1 controls  get routed in
> >> hardware to CS1 line, making the primary flash chip inaccessible. Depending
> >> on the architecture of the user-space software, it may choose to re-enable
> >> access to the primary chip via CS0 at different times. There must be a way to do so.
> >>
> > So by activating cs0, userspace would essentially pull its own root file system
> > from underneath itself ?
> 
> Exactly. That's why for alternate boot the firmware would usually copy
> all filesystems to memory and mount from there. Some embedded systems
> do that always, regardless of which chip they boot from.
> 
That is different, though, to what you said earlier. Linux would then start
with a clean file system, and not need access to the file system in cs1 at all.
Clearing the flag when starting the driver would then be ok.

> However, to be able to recover the main flash chip, the system needs CS0
> to function as such (not as CS1). That's why this control is needed.
> 
If what you said is correct, not really. It should be fine and create more
predictive behavior if the probe function selects cs0 automatically.

Guenter

> As Ivan mentioned, for AST2500 and the upcoming AST2600 the behavior
> is slightly different. They don't just connect both CS controls to CS1 but instead
> swap them so the primary chip becomes secondary from the software point
> of view. The means to restore the normal wiring may still be needed.
> 
> >
> >> This code most probably adds nothing at the assembly level.
> >>
> > That seems quite unlikely. Please demonstrate.
> 
> Yes, you were right. It adds 7 instructions. We'll drop the check.
> It's just my DO-178 background, I add 'robustness' checks everywhere.
> 
> >>>> +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> >>>> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> >>>> +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> >>> The variable reflects the _boot status_. It should not change after booting.
> >> Is there any documentation that dictates that? All I could find is
> >>
> >> "bootstatus: status of the device after booting". That doesn't look to me like it absolutely can not change to reflect the updated status (that is, to reflect that the originally set up alternate CS routing has been reset to normal).
> >>
> > You choose to interpret "after booting" in a kind of novel way,
> > which I find a bit disturbing. I am not really sure how else to
> > describe "boot status" in a way that does not permit such
> > reinterpratation of the term.
> 
> How about "Reflects reasons that caused a reboot, remains constant until the next boot" ?
> 
> > On top of that, how specifically would "WDIOF_EXTERN1" reflect
> > what you claim it does ? Not only you are hijacking bootstatus9
> > (which is supposed to describe the reason for a reboot), you
> > are also hijacking WDIOF_EXTERN1. That seems highly arbitrary
> > to me, and is not really how an API/ABI should be used.
> 
> We used WDIOF_EXTERN1 because:
> 
> 1. We thought that bootstatus _can_ change
> 
> 2. We thought that adding extra bits wouldn't be appreciated
> 
> Now as you clarified that assumption 1 was wrong we are going to implement status as I proposed earlier:
> 
> >
> >> I think we could make 'access_cs0' readable instead, so it could report the
> >> current state of the boot code selection bit. Reverted, I suppose. That
> >> way 'access_cs0' would report 1 after 1 has been written to it (it wouldn't
> >> be possible to write a zero).
> 
> With best regards,
> Alexander Amelkin,
> BIOS/BMC Team Lead, YADRO
> https://yadro.com
> 
> 



