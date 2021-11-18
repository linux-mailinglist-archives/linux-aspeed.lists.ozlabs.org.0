Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C644455B16
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Nov 2021 12:59:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvyyL27Zcz305P
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Nov 2021 22:59:22 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Thu, 18 Nov 2021 22:59:18 AEDT
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvyyG2Ygzz2yb3;
 Thu, 18 Nov 2021 22:59:18 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234407492"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="234407492"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 03:56:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="505577255"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 03:56:07 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id E050020138;
 Thu, 18 Nov 2021 13:56:04 +0200 (EET)
Date: Thu, 18 Nov 2021 13:56:04 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 02/10] media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg
 for log
Message-ID: <YZY/VCt8WZx/4dFt@paasikivi.fi.intel.com>
References: <20211118074030.685-1-jammy_huang@aspeedtech.com>
 <20211118074030.685-3-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118074030.685-3-jammy_huang@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On Thu, Nov 18, 2021 at 03:40:23PM +0800, Jammy Huang wrote:
> The debug log level, 0~3, is controlled by module_param, debug.
> The higher the value, the more the information.
>   0: off
>   1: info
>   2: debug
>   3: register operations
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>

Just wondering: what's the purpose of switching to v4l2_*() functions for
printing when dev_*() equivalents already can do the same?

-- 
Sakari Ailus
