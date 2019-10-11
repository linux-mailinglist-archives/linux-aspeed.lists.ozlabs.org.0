Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A6D41DF
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 15:55:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qTxm0NrHzDqbr
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 00:55:56 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qTxd61JQzDqWp
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 00:55:46 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9BDqBck134849
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 09:55:37 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vjtpjh0vs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 09:55:36 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <clg@kaod.org>;
 Fri, 11 Oct 2019 14:55:33 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 14:55:28 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9BDsvZn37355984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 13:54:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97073A405F;
 Fri, 11 Oct 2019 13:55:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 701BDA4054;
 Fri, 11 Oct 2019 13:55:27 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 13:55:27 +0000 (GMT)
Received: from yukon.kaod.org (sig-9-145-63-191.uk.ibm.com [9.145.63.191])
 by smtp.tls.ibm.com (Postfix) with ESMTP id E8BD22201CE;
 Fri, 11 Oct 2019 15:55:25 +0200 (CEST)
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Fri, 11 Oct 2019 15:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101113-0012-0000-0000-0000035732C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101113-0013-0000-0000-000021923FB5
Message-Id: <3244b1ce-587c-6f12-cc9c-7eee0354e76b@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=691 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110130
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/10/2019 14:28, Boris Brezillon wrote:
> On Fri,  4 Oct 2019 13:59:07 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> +#define ASPEED_SMC_HCLK_DIV(i) \
>> +	(aspeed_smc_hclk_divs[(i) - 1] << CONTROL_CLOCK_FREQ_SEL_SHIFT)
>> +
>> +static u32 aspeed_smc_default_read(struct aspeed_smc_chip *chip)
>> +{
>> +	/*
>> +	 * Keep the 4Byte address mode on the AST2400 SPI controller.
>> +	 * Other controllers set the 4Byte mode in the CE Control
>> +	 * Register
>> +	 */
>> +	u32 ctl_mask = chip->controller->info == &spi_2400_info ?
>> +		 CONTROL_IO_ADDRESS_4B : 0;
>> +
>> +	return (chip->ctl_val[smc_read] & ctl_mask) |
>> +		(0x00 << 28) | /* Single bit */
>> +		(0x00 << 24) | /* CE# max */
>> +		(0x03 << 16) | /* use normal reads */
>> +		(0x00 <<  8) | /* HCLK/16 */
>> +		(0x00 <<  6) | /* no dummy cycle */
>> +		(0x00);        /* normal mode */
> 
> IIUC, you're using a SPINOR_OP_READ operation to read the golden
> buffer, and if I'm right, you start reading at offset 0 of the dirmap
> window (offset 0 in the flash), so basically the first block in the NOR.

Yes.

> What happens if this block is erased? In that case your golden buf will
> contain only 0xff values, and the read calibration is likely to be
> useless 

yes. that is why we have the aspeed_smc_check_calib_data() routine to
check that the data read makes some sense. If this is not the case, then :

	 "Calibration area too uniform, using low speed"

> (how can you determine if timings are good when IO pins always
> stay high). Don't we have a command that return non-ff/non-0 data while
> still being predictable and immutable? 

Not that I know of on these controllers.

> Do you expect users to always
> flash a pattern that helps calibrating those delays?

This is the case on the OpenBMC systems, AFAICT. 

u-boot.bin should be the data read on the FMC controller and the 
SPI controller contains the host Firmware which is as random.   

> 
>> +}
>> +
>> +static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>> +				    u32 max_freq)
>> +{
>> +	u8 *golden_buf, *test_buf;
>> +	int i, rc, best_div = -1;
>> +	u32 save_read_val = chip->ctl_val[smc_read];
>> +	u32 ahb_freq = chip->controller->clk_frequency;
>> +
>> +	dev_dbg(chip->nor.dev, "AHB frequency: %d MHz", ahb_freq / 1000000);
>> +
>> +	test_buf = kmalloc(CALIBRATE_BUF_SIZE * 2, GFP_KERNEL);
>> +	golden_buf = test_buf + CALIBRATE_BUF_SIZE;
>> +
>> +	/* We start with the dumbest setting (keep 4Byte bit) and read
>> +	 * some data
>> +	 */
>> +	chip->ctl_val[smc_read] = aspeed_smc_default_read(chip);
>> +
>> +	writel(chip->ctl_val[smc_read], chip->ctl);
>> +
>> +	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
>> +
>> +	/* Establish our read mode with freq field set to 0 (HCLK/16) */
>> +	chip->ctl_val[smc_read] = save_read_val & 0xfffff0ff;
>> +
>> +	/* Check if calibration data is suitable */
>> +	if (!aspeed_smc_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
>> +		dev_info(chip->nor.dev,
>> +			 "Calibration area too uniform, using low speed");
>> +		writel(chip->ctl_val[smc_read], chip->ctl);
>> +		kfree(test_buf);
>> +		return 0;
>> +	}
>> +
>> +	/* Now we iterate the HCLK dividers until we find our breaking point */
>> +	for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
>> +		u32 tv, freq;
>> +
>> +		/* Compare timing to max */
>> +		freq = ahb_freq / i;
>> +		if (freq > max_freq)
>> +			continue;
>> +
>> +		/* Set the timing */
>> +		tv = chip->ctl_val[smc_read] | ASPEED_SMC_HCLK_DIV(i);
>> +		writel(tv, chip->ctl);
>> +		dev_dbg(chip->nor.dev, "Trying HCLK/%d...", i);
>> +		rc = aspeed_smc_calibrate_reads(chip, i, golden_buf, test_buf);
>> +		if (rc == 0)
>> +			best_div = i;
>> +	}
>> +	kfree(test_buf);
>> +
>> +	/* Nothing found ? */
>> +	if (best_div < 0) {
>> +		dev_warn(chip->nor.dev, "No good frequency, using dumb slow");
>> +	} else {
>> +		dev_dbg(chip->nor.dev, "Found good read timings at HCLK/%d",
>> +			best_div);
>> +		chip->ctl_val[smc_read] |= ASPEED_SMC_HCLK_DIV(best_div);
>> +	}
>> +
>> +	writel(chip->ctl_val[smc_read], chip->ctl);
>> +	return 0;
>> +}
> 
> 

