Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32F4AD6A9
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Feb 2022 12:28:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLP33pvYz3bTQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Feb 2022 22:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t0ybZeeH;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=t0ybZeeH; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtLNz5KScz2xXX;
 Tue,  8 Feb 2022 22:28:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD7D7615EF;
 Tue,  8 Feb 2022 11:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2927C004E1;
 Tue,  8 Feb 2022 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644319711;
 bh=S/OkajaK//lhGgvpH8Fw06Nx4ATm9sAyJIS5raQ2bvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0ybZeeHBJKmL5e5GBklD/SFNg2ORM9tj6Uo94eWeAyDaZznYCaSGBMNaoKafm9Rx
 o26RX7aXd2Niprs6HcmE6Xc+k1+wpuIvcCGKjthZfKnrVjNwbyTlR6uWsSW7lg2Sgn
 rVoqZL/xTG2Nwq7Q4um8qFYpeVKRyLKz3iFMsY8o=
Date: Tue, 8 Feb 2022 12:28:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v7 07/13] peci: Add sysfs interface for PECI bus
Message-ID: <YgJT3bd8Uj8omVYz@kroah.com>
References: <20220202144838.163875-1-iwona.winiarska@intel.com>
 <20220202144838.163875-8-iwona.winiarska@intel.com>
 <YgJPFlr18AmWiTRY@kroah.com>
 <CACPK8Xc0Mo-eAH3bv1uAWxAsPFkLk0gZr9Sx0T0An68Lt2+c+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xc0Mo-eAH3bv1uAWxAsPFkLk0gZr9Sx0T0An68Lt2+c+Q@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jonathan Corbet <corbet@lwn.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Muller <d.mueller@elsoft.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Feb 08, 2022 at 11:15:30AM +0000, Joel Stanley wrote:
> On Tue, 8 Feb 2022 at 11:08, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Feb 02, 2022 at 03:48:32PM +0100, Iwona Winiarska wrote:
> > > PECI devices may not be discoverable at the time when PECI controller is
> > > being added (e.g. BMC can boot up when the Host system is still in S5).
> > > Since we currently don't have the capabilities to figure out the Host
> > > system state inside the PECI subsystem itself, we have to rely on
> > > userspace to do it for us.
> > >
> > > In the future, PECI subsystem may be expanded with mechanisms that allow
> > > us to avoid depending on userspace interaction (e.g. CPU presence could
> > > be detected using GPIO, and the information on whether it's discoverable
> > > could be obtained over IPMI).
> > > Unfortunately, those methods may ultimately not be available (support
> > > will vary from platform to platform), which means that we still need
> > > platform independent method triggered by userspace.
> > >
> > > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> > > ---
> > >  Documentation/ABI/testing/sysfs-bus-peci | 16 +++++
> > >  drivers/peci/Makefile                    |  2 +-
> > >  drivers/peci/core.c                      |  3 +-
> > >  drivers/peci/device.c                    |  1 +
> > >  drivers/peci/internal.h                  |  5 ++
> > >  drivers/peci/sysfs.c                     | 82 ++++++++++++++++++++++++
> > >  6 files changed, 107 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
> > >  create mode 100644 drivers/peci/sysfs.c
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-bus-peci b/Documentation/ABI/testing/sysfs-bus-peci
> > > new file mode 100644
> > > index 000000000000..56c2b2216bbd
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-bus-peci
> > > @@ -0,0 +1,16 @@
> > > +What:                /sys/bus/peci/rescan
> > > +Date:                July 2021
> > > +KernelVersion:       5.15
> >
> > 5.15 was a long time ago :(
> >
> >
> > Other than this nit, these all look semi-sane to me.  What tree are you
> > wanting these to go through, mine?  If so, can you fix this up (both
> > places in this file) and resend?
> 
> Yes, I recommend Iwona send these through your tree.
> 
> Thanks for taking another look over them. Thanks to Iwona and Intel
> for doing this work.

Can you provide an ack or reviewed-by for them when they are reposted so
I know this?

thanks,

greg k-h
