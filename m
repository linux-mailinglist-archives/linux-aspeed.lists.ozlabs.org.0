Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 516334EAACE
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 11:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSPzr1lKTz2xvW
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 20:54:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=atomide.com
 (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com;
 receiver=<UNKNOWN>)
Received: from muru.com (muru.com [72.249.23.125])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KSPzj4nq6z2xXB;
 Tue, 29 Mar 2022 20:54:25 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 96F5180F9;
 Tue, 29 Mar 2022 09:52:18 +0000 (UTC)
Date: Tue, 29 Mar 2022 12:54:21 +0300
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <YkLXTWdZ3zASxr4H@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Daniel Palmer <daniel@0x0f.com>,
 linux-arm-kernel@axis.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > For example, I have a pile of pending omap clock clean-up dts patches
> > posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> > redoing or fixing up the patches with sed :)
> 
> Git merge/rebase/cherry-pick should handle renames fine?

Possibly.. Not sure I'd count on that based on my earlier experiences
though :)

Tony
