Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38B6F022E
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 09:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6Sl03mDPz3f4L
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Apr 2023 17:57:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
X-Greylist: delayed 515 seconds by postgrey-1.36 at boromir; Thu, 27 Apr 2023 17:57:25 AEST
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6Sks5L38z3cBp;
	Thu, 27 Apr 2023 17:57:25 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id AA15480A4;
	Thu, 27 Apr 2023 07:48:46 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:48:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Message-ID: <20230427074845.GG14287@atomide.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
 <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>, linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

* Geert Uytterhoeven <geert@linux-m68k.org> [230427 07:47]:
> On Thu, Apr 27, 2023 at 9:37 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > On 25/04/2023 17:57, Rob Herring wrote:
> > > On Tue, Apr 25, 2023 at 2:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >> On Tue, Apr 25, 2023 at 12:16 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >>> I have a script[1] that does the conversion written the last time this
> > >>> came up. Just have to agree on directory names. I think the easiest
> > >>> would be for Arnd/Olof to run it at the end of a merge window before
> > >>> rc1.
> > >>
> > >> "emev2" and "sh7" are missing for renesas.
> > >
> > > No doubt it's been bitrotting (or I may have missed some).
> > >
> > >> Does your script also cater for .dts files not matching any pattern,
> > >> but including a .dtsi file that does match a pattern?
> > >
> > > I assume I built everything after moving, but maybe not...
> > >
> > > That's all just "details". First, we need agreement on a) moving
> > > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > > been stuck on a) for being 'too much churn'.
> > >
> >
> > I think it makes sense to move them and probably the best way to do so is, as
> > you proposed: that Arnd or Olof run the script to move them just before -rc1
> 
> FTR, no objections from my side.

Sounds good to me.

Regards,

Tony
