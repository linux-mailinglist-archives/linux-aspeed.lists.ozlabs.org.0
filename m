Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B640F70CD5
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2019 00:44:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sxVX2thszDqVs
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2019 08:44:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sxVN2rq5zDqSk
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2019 08:43:55 +1000 (AEST)
Received: by mail-io1-f67.google.com with SMTP id z3so77698998iog.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2019 15:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Svp74BvkdGsqSw/CVQeALZTPJjUPC2evM1cScX7kmfc=;
 b=Mi8UueYzdcjkarEEAn6n522hxoBzZ2mRdpd17QijXdVKEbOxI3tjTTjv8WA0i88leq
 xUcpctopkGAYpV5I8IEWwF7RyJz7Ym9DEZkwYpJsHOOJwuufuVJ9htsaY2NBVXxj+7VD
 HZn7bkhgKf204hdVAgPK5TTmfc1jX/LrYAOZFH3h2qf8kWn2icfx0RMhq3Rsg1b5sSW4
 XuL9Tg5iu1OjUMxpnK/VJdbmTXtIODt+OqS6ME8NkIUvcHVk/hhFUjqhagPRhwYi9MiP
 EEM3kPP2eRkUmW/xqNTHrJ0dgwGEY4ThbOi3di9EdUTmdJoh5u3cYLC6jis1kaiBpzkN
 GuZA==
X-Gm-Message-State: APjAAAXfGmy99YibZyoDK0J3le+idFHphWqUdwalCR26I56+PmBCdRvQ
 otxc/LINViVZ/fMQ0Fd0aw==
X-Google-Smtp-Source: APXvYqyEzhs4Q0KHFzrQB3A2UUaYKgS3Bjub7g5xu87KWZze3VmYU1AICYNgXLhU9c/erhypSpAdcA==
X-Received: by 2002:a6b:dc08:: with SMTP id s8mr21558994ioc.209.1563835432947; 
 Mon, 22 Jul 2019 15:43:52 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id t133sm58987380iof.21.2019.07.22.15.43.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:43:52 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:43:51 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: soc: Add Aspeed XDMA engine binding
 documentation
Message-ID: <20190722224351.GA18423@bogus>
References: <1562010839-1113-1-git-send-email-eajames@linux.ibm.com>
 <1562010839-1113-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562010839-1113-2-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, eduval@amazon.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon,  1 Jul 2019 14:53:52 -0500, Eddie James wrote:
> Document the bindings.
> 
> Reviewed-by: Andrew Jeffrey <andrew@aj.id.au>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.txt        | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
