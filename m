Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17673157FF8
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Feb 2020 17:41:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GWr24hBTzDqMb
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Feb 2020 03:41:06 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Feb 2020 03:40:55 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GWqq3T7XzDqLw
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Feb 2020 03:40:54 +1100 (AEDT)
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M72bv-1j9BiA0tHb-008YM4 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Feb
 2020 17:35:37 +0100
Received: by mail-qk1-f171.google.com with SMTP id c188so7082898qkg.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Feb 2020 08:35:36 -0800 (PST)
X-Gm-Message-State: APjAAAU7NvJKqz7zlnC3dKd1l9AR83Kse9FfJJt6UJaTcE6kAo18wc3R
 5w589uGJTW/LE0o1t+NgOi94KmHd6wMe0hREH+E=
X-Google-Smtp-Source: APXvYqzwsmadsnYEYT4Ek1X+K2TCw5F0cgvsuN+fGPdnvrDqGEuNOwdA27X52ZmPPjeq150xVoqs1ywlchc9VsQt1FA=
X-Received: by 2002:a37:e409:: with SMTP id y9mr2224481qkf.352.1581352535220; 
 Mon, 10 Feb 2020 08:35:35 -0800 (PST)
MIME-Version: 1.0
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Feb 2020 17:35:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3HsdpLz0aDGem1BrQsNo2mEJOnOsLcKFcLjaERx9dhGg@mail.gmail.com>
Message-ID: <CAK8P3a3HsdpLz0aDGem1BrQsNo2mEJOnOsLcKFcLjaERx9dhGg@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] soc: aspeed: Add XDMA Engine Driver
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:KvEmG5yrW9c1Y6olzoqe5RkTHgTOpVcGi2egHugTkGHl0CCXRT9
 hM12pbHx8sztgELfL83GG/RO6CcsWo3/ZnHOBPjqDKCBupqBfqpvq55b/AjHWk9j0bxxZh0
 tInjtKYz26qkGiZRUidm6Ehr//4xr4wtD+QT+z3xUYLEmpPSr+MxHNchlR9p/lSE0mHf10M
 1ABIieJmRlhKyE4/vKndw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bSIKeTK4DjM=:6zVGv5rhqRZH3zmkZfQc7h
 68wKT0ca+cQsEr2WYhvtTJWF49OtTy74ojByhu7CArKgE1vQ5wvL6lx2NnvQoZ7XNUlWEZCEA
 kxRGhiCFqs/669Lzf/BbWuxbff2at6l5KPKrjj+lgS19NSvo0eqd3RlTuF4pf4lyGl+RfN0US
 IksMpocGMpNwmvc5DEJHebPGL/QusMig6LrQHmvsLa/vA6tDjccKKkKcP8rN9LKY+NBDZ1CNG
 Dof/QCW4CorWse9ir1yEw/7c4YTnMZ0tW/jHXbpMSber3JfsdIQtgS4HnmOoGADeGySnTEV+8
 p9BspnH+JoH7kNkO0bvtns4iz9oygl5DwBbtcqzNHO2tpAjt0CcayNwmierQAtcBsHQvgPNAn
 ZPLxmZtvvKRt+RKyjKaP3u4qs0wWRu5k43gDEU2U6NK4QSVZnBvuHVs9PGNy6VmRvxFX+Cd+Q
 P1Z+bCX8O7SlxY1bWjSgAQy+S/2oLUmtXmJRuNx21ryvfE9JB9bM6H088LzB+t2yPuCQkZ0A8
 yyt92c6te5qd7wvVddxpAO8ci6tugZPv1sZz/jUvyt0F8GAopp7katx9byENczNcKCiW7pfAC
 IFvOYHoMYaXy/ZJcyv+zFcOkXLYTfUVOXUCzoNnNPuyAQiPawzjjGWPIGOmEW7HnGPaop41nr
 LwAwz5vKgyIcEqQMhqznTSFnze2GLl9/+6xuxbknWY+cUzNNr4Vc+CI2Q23QRmDGDBaHYdqRb
 n1LuhvAszrsU69aFkTGtjzA9SqLezxUywXrscDOlT0izjV0nXvFghywFBwFK6GKYgbqAEWPtM
 chLj6HL/G6fGbBBOvFVjDaYNLS9JXxL750QLXECyzVvhhj3EaU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 15, 2020 at 10:31 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
> DMA operations between the SOC (acting as a BMC) and a host processor
> in a server.
>
> This commit adds a driver to control the XDMA engine and adds functions
> to initialize the hardware and memory and start DMA operations.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Hi Eddie,

I'm missing the bigger picture in the description here, how does this fit into
the PCIe endpoint framework and the dmaengine subsystem?

Does the AST2500 show up as a PCIe device in the host, or do you just
inject DMAs into the host and hope that bypasses the IOMMU?
If it shows up as an endpoint, how does the endpoint driver link into the
dma driver?

     Arnd
