Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534D286D48
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Oct 2020 05:50:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6HKg4d6dzDqSf
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Oct 2020 14:50:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+5f748a34@netrider.rowland.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rowland.harvard.edu
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4C65RS5yzszDqHl
 for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Oct 2020 07:24:51 +1100 (AEDT)
Received: (qmail 456826 invoked by uid 1000); 7 Oct 2020 10:58:09 -0400
Date: Wed, 7 Oct 2020 10:58:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/3] usb: host: add uhci compatible support for
 ast2600-uhci
Message-ID: <20201007145809.GA456169@rowland.harvard.edu>
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-3-ryan_chen@aspeedtech.com>
 <CACPK8Xc2Y1njgtrtjO1bdmkcQR7jDu+oaOBc3R+CWtn+UrEOhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xc2Y1njgtrtjO1bdmkcQR7jDu+oaOBc3R+CWtn+UrEOhQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 08 Oct 2020 14:50:28 +1100
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 07, 2020 at 11:25:04AM +0000, Joel Stanley wrote:
> On Wed, 30 Sep 2020 at 04:08, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> >
> > Add support for AST2600 SOC UHCI driver.
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> USB maintainers, can you please take this patch (2/3)? I will take the
> others in this series through the aspeed tree.
> 
> Cheers,
> 
> Joel
> 
> 
> > ---
> >  drivers/usb/host/uhci-platform.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> > index 70dbd95c3f06..fa40fe125c2a 100644
> > --- a/drivers/usb/host/uhci-platform.c
> > +++ b/drivers/usb/host/uhci-platform.c
> > @@ -113,7 +113,8 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
> >                                 num_ports);
> >                 }
> >                 if (of_device_is_compatible(np, "aspeed,ast2400-uhci") ||
> > -                   of_device_is_compatible(np, "aspeed,ast2500-uhci")) {
> > +                       of_device_is_compatible(np, "aspeed,ast2500-uhci") ||
> > +                       of_device_is_compatible(np, "aspeed,ast2600-uhci")) {
> >                         uhci->is_aspeed = 1;
> >                         dev_info(&pdev->dev,
> >                                  "Enabled Aspeed implementation workarounds\n");
> > --
> > 2.17.1
> >

The indentation of the continuation lines isn't good, because the 
continued parts are aligned with the lines in the conditional block.  
They should be visually distinct.  Either align with the "of_device..." 
at the start or indent by two extra tab stops.

Once this is fixed, you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
