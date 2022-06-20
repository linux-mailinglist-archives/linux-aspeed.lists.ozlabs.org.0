Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD8551237
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 10:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRMlw4KKWz3bbv
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jun 2022 18:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mV43WhCd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mV43WhCd;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRHfb2h8Sz3bbs;
	Mon, 20 Jun 2022 15:05:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655701559; x=1687237559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CFFG2LTJ/49RkrrvRheatNkvjYQNThXwuBHWnmvnA4=;
  b=mV43WhCd/7zypKlWJJAHNvOcjEn6eFxy50wqdRNQuajvoZ/4+im3AgAB
   +Xeujul2jeBzDGV1/Ps1ZRn2ze0t8zXNOHqdwSuqldQnW9rcQBA8/3uYN
   peEeC944DLjkPsSDV9VCSHiO8KpbfrAP5Q8TbFNNqYnYi/9OmHsBDhZWY
   ZXLcdWYFmYE8ymONEzeL/4rGdokdElZIsNSaQQkzkpFJ4k0pk1LFf3wZC
   lqSR8xqXm/08s2TQoYzIU5WMs3jvp/oMT0fJxsekYxdL6Bm8KxKXo25KP
   a9dtF09b7R+ZK8V3tlYW0AkD7PYA8qhA99HUX4SJ7Qopkbpm4VO/2cP/u
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280533283"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280533283"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 22:05:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="654500483"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 22:05:48 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 20 Jun 2022 08:05:46 +0300
Date: Mon, 20 Jun 2022 08:05:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David Gow <davidgow@google.com>
Subject: Re: [PATCH 3/5] thunderbolt: test: Use kunit_test_suite() macro
Message-ID: <YrAAKqdiG3GAGh1r@lahna>
References: <20220618090310.1174932-1-davidgow@google.com>
 <20220618090310.1174932-4-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618090310.1174932-4-davidgow@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 20 Jun 2022 18:06:19 +1000
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
Cc: linux-mmc@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>, Daniel Latypov <dlatypov@google.com>, linux-usb@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jun 18, 2022 at 05:03:08PM +0800, David Gow wrote:
> The new implementation of kunit_test_suite() for modules no longer
> conflicts with module_init, so can now be used by the thunderbolt tests.
> 
> Also update the Kconfig entry to enable the test when KUNIT_ALL_TESTS is
> enabled.
> 
> This means that kunit_tool can now successfully run and parse the test
> results with, for example:
> 	./tools/testing/kunit/kunit.py run --arch=x86_64 \
> 	--kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_USB4=y \
> 	'thunderbolt'
> 
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
