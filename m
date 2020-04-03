Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546D19D747
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 15:09:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v0cv6qt7zDsP1
	for <lists+linux-aspeed@lfdr.de>; Sat,  4 Apr 2020 00:09:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fmq9EUdh; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v0cg6RyFzDsND
 for <linux-aspeed@lists.ozlabs.org>; Sat,  4 Apr 2020 00:08:46 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id 111so7094063oth.13
 for <linux-aspeed@lists.ozlabs.org>; Fri, 03 Apr 2020 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tU19EWZx8u2e2uV3dXR0FXwxIY/5U2XJW8CrROjNUIg=;
 b=fmq9EUdhdn++eKwVsAKvmtE6dEOtCu87AzVYsS8RdLDIW9lhNi2aEJOROLq/8YC0cp
 0NtDqpQaHOt02earYciLZFbMHdvr0oO3V04QvdXy8xdw5jfNZwJ5rCWYTGYEinHScC0b
 QB8YAgWxNnOWYx7UZw1/Vcp2HZ7xe8MlU3mY4egH5fsefs7+83mEZoF+87uWHAG8PASB
 6HPQCf64opNRU+9Pm7PJ1ulZVviDAVR2DvSb/2hB+xM2pqJ2/0yRYbQALF2JO9kd/UH+
 e+Qo4mr05Nu4mst9MWQVjXl94DWlXTSQ/5MNFErnwh7ht2gB6EKnTFdrMEvc9HFjVSrR
 O+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=tU19EWZx8u2e2uV3dXR0FXwxIY/5U2XJW8CrROjNUIg=;
 b=eG1pyBmLC0Up/2borDflpaewoBIokMpuVYE8agDU8OCNhOt9/9PvcL1ajgdnInELxn
 HRHLXGjJdJmQ+jcD0jmGtruuBNayLK7MYHIFOc5UN+tJueiFpTFrSQxLTWX+YmH0Cm7Y
 VdTQVcbNhklXAlm8cIfaBKuP7i2/HuK83lBuCYqEOq/zzW5HRpVnQ5yLbiDhUP8F9mJX
 Wpdo+I1mXz6QRmKgW5J75RmhYogFwc4/S6oY1CLZhz0DLLXuzJz9AYENYaJPzjooi7vT
 fgn/mCPUvQaIeyunY2dKfadx0TcgxKMuE10k1BTdPAZVkN6WrZ9k9ioMy/Azy/z/PMQZ
 NLMw==
X-Gm-Message-State: AGi0PublQtlNBu/3FdFexU1stUQt3vWWneZqnshkw7TAzFg4rl0BwtsB
 acO+GhCDjYTJ20crXomb/A==
X-Google-Smtp-Source: APiQypJOH5J7K90OLTvE4up+WlGYwk/WIHDu36NWekh7qDcyAQo4WCvI75rBiKzmy/uvySr5/C0L0A==
X-Received: by 2002:a9d:644:: with SMTP id 62mr5581256otn.177.1585919323801;
 Fri, 03 Apr 2020 06:08:43 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id 12sm2192250oii.54.2020.04.03.06.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:08:42 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 0586B18016D;
 Fri,  3 Apr 2020 13:08:42 +0000 (UTC)
Date: Fri, 3 Apr 2020 08:08:40 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 0/3] ipmi: kcs-bmc: Rework bindings to clean up DT
 warnings
Message-ID: <20200403130840.GR2910@minyard.net>
References: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
 <7734002a-181e-4baf-b9a3-af66894acc16@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7734002a-181e-4baf-b9a3-af66894acc16@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: minyard@acm.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 02:20:21PM +1030, Andrew Jeffery wrote:
> 
> 
> On Mon, 16 Dec 2019, at 12:57, Andrew Jeffery wrote:
> > Hello,
> > 
> > This is a short series reworking the devicetree binding and driver for the
> > ASPEED BMC KCS devices. With the number of supported ASPEED BMC devicetrees the
> > changes enable removal of more than 100 lines of warning output from dtc.
> > 
> > v1 can be found here:
> > 
> > https://lore.kernel.org/lkml/cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au/
> > 
> > v2 cleans up the commit message of 2/3 and changes the name of the property
> > governing the LPC IO address for the KCS devices.
> 
> Ping?

Sorry, I've been busy.  I've looked this over and it seems ok, and it's
in my next tree.

Thanks,

-corey
