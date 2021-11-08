Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C2449BF5
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Nov 2021 19:47:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp0TM5L1qz2yy3
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Nov 2021 05:47:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp0TH57Spz2xrm
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Nov 2021 05:46:58 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="219501434"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="219501434"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 10:45:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="731652744"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.9.59])
 ([10.209.9.59])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 10:45:55 -0800
Message-ID: <9999397c-32ce-b034-c174-bc3c0dbc52a8@linux.intel.com>
Date: Mon, 8 Nov 2021 10:45:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Joel Stanley <joel@jms.id.au>, "Winiarska, Iwona"
 <iwona.winiarska@intel.com>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Yang Yingliang <yangyingliang@huawei.com>
References: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
 <f2b3f804-0908-489e-8a95-65f35f4c3e61@www.fastmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <f2b3f804-0908-489e-8a95-65f35f4c3e61@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks a lot for your review.

-Jae

