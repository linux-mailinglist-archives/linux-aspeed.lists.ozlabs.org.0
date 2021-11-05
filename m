Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E144679E
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 18:12:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm6WR1dBgz3051
	for <lists+linux-aspeed@lfdr.de>; Sat,  6 Nov 2021 04:12:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm6WN59Tpz2xXP
 for <linux-aspeed@lists.ozlabs.org>; Sat,  6 Nov 2021 04:12:15 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="295389362"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="295389362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 10:09:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="600687628"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.9.156])
 ([10.209.9.156])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 10:09:03 -0700
Message-ID: <99174f5f-2282-45a6-680c-94f86ff29860@linux.intel.com>
Date: Fri, 5 Nov 2021 10:08:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] soc: aspeed: lpc-ctrl: Block error printing on probe
 defer cases
Content-Language: en-US
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "joel@jms.id.au" <joel@jms.id.au>
References: <20211104173709.222912-1-jae.hyun.yoo@intel.com>
 <6057e8fe3bc84c719e0dc3cc4753a472ac92a8bf.camel@intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <6057e8fe3bc84c719e0dc3cc4753a472ac92a8bf.camel@intel.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Thank a lot for your review.

-Jae
